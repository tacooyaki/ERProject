class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :confirmation]

  def new
    @order = current_user.orders.build
    setup_addresses_for(@order)
    load_cart_items
  end

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
    @order = current_user.orders.build(order_params)
    build_order_items
    calculate_financials(@order)
    if @order.save
      redirect_to confirmation_order_path(@order), notice: 'Thank you for your order.'
    else
      render :review, status: :unprocessable_entity
    end
  end

  def recalculate
    @order = current_user.orders.build
    unless current_user.addresses.exists?
      flash[:alert] = "You must add a shipping address before you can proceed."
      redirect_to new_user_address_path(user_id: current_user.id) and return
    end
  end

  def review
    @order = current_user.orders.build(order_params)
    build_order_items
    calculate_financials(@order)

    if @order.valid?
      session[:order_details] = @order.attributes
      session[:order_items] = @order.order_items.map(&:attributes)
      redirect_to display_review_orders_path
    else
      flash[:alert] = 'Please correct the errors.'
      render :recalculate
    end
  end

  def process_review
    @order = Order.new(session[:order_details])
    @order.assign_attributes(order_params.except(:order_items_attributes))
    order_params[:order_items_attributes]&.each do |item_attributes|
      @order.order_items.build(item_attributes)
    end

    if @order.save
      clear_order_session
      redirect_to order_path(@order), notice: 'Order successfully placed.'
    else
      render :review, alert: 'There was an error placing your order.'
    end
  end

  def display_review
    # Load the order from the session
    @order = Order.new(session[:order_details])
    @order.order_items.build(session[:order_items] || [])
    render :review
  end

  def confirmation
    @order = current_user.orders.find_by(id: params[:id])

    if @order.update(order_params)
      session[:shopping_cart].clear
      redirect_to order_path(@order), notice: 'Thank you for your order.'
    else
      flash[:alert] = 'Please review your order before finalizing.'
      render :review
    end
  end

  def show
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end

  private

  def clear_order_session
    session.delete(:shopping_cart)
    session.delete(:order_details)
    session.delete(:order_items)
  end

  def set_order
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to new_order_path, alert: "Invalid order. Please start a new order." unless @order
  end

  #def order_params
  # params.permit(:shipping_address_id)
  #end

  def order_params
    params.require(:order).permit(
      :shipping_address_id,
      order_items_attributes: [:product_id, :quantity, :unit_price]
    )
  end

  def setup_addresses_for(order)
    order.build_shipping_address unless order.shipping_address
  end

  def load_cart_items
    @cart_items = session[:shopping_cart].map do |product_id, quantity|
      product = Product.find(product_id)
      [product, quantity] if product
    end.compact
  end

  def build_order_items
    session[:shopping_cart].each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.build(product: product, quantity: quantity, unit_price: product.price) if product
    end
  end

  def calculate_financials(order)
    order.subtotal = order.order_items.sum { |item| item.unit_price * item.quantity }.round(2)
    order.tax = calculate_tax(order).round(2)
    order.total = (order.subtotal + order.tax).round(2)
  end

  def calculate_tax(order)
    tax_rate = TaxRate.find_by(province: order.shipping_address.province)
    if tax_rate
      order.subtotal * ((tax_rate.gst + tax_rate.pst + tax_rate.hst) / 100)
    else
      0
    end
  end
end
