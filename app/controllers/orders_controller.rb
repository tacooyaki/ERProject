class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_user.orders.build
    setup_addresses_for(@order)
    load_cart_items
  end

  def create
    @order = current_user.orders.build(order_params)
    build_order_items
    @order.tax = @order.calculate_tax

    if @order.save
      session[:shopping_cart].clear
      redirect_to order_path(@order), notice: 'Thank you for your order.'
    else
      render :new
    end
  end


  private

  def order_params
    params.require(:order).permit(
      :total_price,  # placeholder
      shipping_address_attributes: [:street, :city, :province, :postal_code, :country],
      billing_address_attributes: [:street, :city, :province, :postal_code, :country]
    )
  end

  def setup_addresses_for(order)
    order.build_shipping_address unless order.shipping_address
    order.build_billing_address unless order.billing_address
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
    @cart_items = session[:shopping_cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      [product, quantity] if product
    end.compact
  end

  def confirmation
    @order = Order.find(params[:id])
    unless current_user == @order.user
      redirect_to root_path, alert: "You do not have access to this order."
    end
  end


end
