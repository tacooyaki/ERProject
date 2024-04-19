class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:review, :confirmation]

  def new
    @order = current_user.orders.build
    setup_addresses_for(@order)
    load_cart_items
  end

  def review
    if @order.update(order_params)
      calculate_financials(@order)
      render :review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation

    if @order.save
      session[:shopping_cart].clear
      redirect_to order_path(@order), notice: 'Thank you for your order.'
    else
      render :review, status: :unprocessable_entity
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

  private

  def set_order
    @order = current_user.orders.find_by(id: params[:order_id])
    unless @order
      redirect_to new_order_path, alert: "Invalid order. Please start a new order."
    end
  end

  def order_params
    params.require(:order).permit(:shipping_address_id)
  end

  def setup_addresses_for(order)
    order.build_shipping_address unless order.shipping_address
  end

  def load_cart_items
    @cart_items = session[:shopping_cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      [product, quantity] if product
    end.compact
  end

  def calculate_financials(order)
    order.subtotal = order.order_items.sum { |item| item.unit_price * item.quantity }
    order.tax = calculate_tax(order)
    order.total = order.subtotal + order.tax
  end

  def calculate_tax(order)
    if order.shipping_address
      tax_rate = TaxRate.find_by(province: order.shipping_address.province)
      tax_rate ? order.subtotal * ((tax_rate.gst + tax_rate.pst + tax_rate.hst) / 100) : 0
    else
      0
    end
  end
end
