class OrdersController < ApplicationController
  before_action :authenticate_user!

  def confirmation
    @order = Order.find_by(id: params[:id])
    if @order.nil?
      redirect_to root_path, alert: "Order not found."
      return
    end

    if @order.user != current_user
      redirect_to root_path, alert: "You do not have access to this order."
      return
    end
  end

  def show
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end


  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    if session[:shopping_cart].blank? || session[:shopping_cart].all? { |_, quantity| quantity.zero? }
      redirect_to cart_path, alert: "Your cart is empty. Please add some products before checking out."
    else
      @order = current_user.orders.build
      setup_addresses_for(@order)
      load_cart_items
      @order.subtotal = @order.calculate_subtotal
      @order.tax = @order.calculate_tax
      @order.total = @order.calculate_total
    end
  end

  def create
    @order = current_user.orders.build(order_params)
    build_order_items
    @order.tax = @order.calculate_tax

    if @order.shipping_address.nil?
      flash.now[:alert] = 'Shipping address is required.'
      setup_addresses_for(@order)
      load_cart_items
      render :new, status: :unprocessable_entity and return
    end

    if @order.save
      session[:shopping_cart].clear
      redirect_to confirmation_order_order_path(@order), notice: 'Thank you for your order.'
    else
      setup_addresses_for(@order)
      load_cart_items
      render :new, status: :unprocessable_entity
    end
  end

  def update_financials
    @order = current_user.orders.build(order_params)
    @order.subtotal = @order.calculate_subtotal
    @order.tax = @order.calculate_tax
    @order.total = @order.calculate_total

    respond_to do |format|
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :shipping_address_id,
      shipping_address_attributes: [:street, :city, :province, :postal_code, :country],
      billing_address_attributes: [:street, :city, :province, :postal_code, :country]
    )
  end

  def setup_addresses_for(order)
    order.build_shipping_address unless order.shipping_address || order.shipping_address_id.present?
    order.build_billing_address unless order.billing_address || order.billing_address_id.present?
  end


  def build_order_items
    session[:shopping_cart].each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        @order.order_items.build(product: product, quantity: quantity, unit_price: product.price)
      end
    end
  end

  def load_cart_items
    @cart_items = []
    session[:shopping_cart].each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      @cart_items << [product, quantity] if product
    end
  end

end
