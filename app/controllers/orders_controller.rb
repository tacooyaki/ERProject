class OrdersController < ApplicationController

  before_action :authenticate_user!

  def new
    @order = current_user.orders.build
    @order.build_shipping_address unless @order.shipping_address
    @order.build_billing_address unless @order.billing_address
    load_cart_items
  end

  def create
    @order = current_user.orders.build(order_params)
    build_order_items
    if @order.save
      session[:shopping_cart].clear
      redirect_to @order, notice: 'Thank you for your order.'
    else
      load_cart_items
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address_attributes, :billing_address_attributes)
  end

  def build_order_items
    session[:shopping_cart].each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.build(product: product, quantity: quantity, unit_price: product.price)
    end
  end

  def load_cart_items
    @cart_items = session[:shopping_cart].map do |product_id, quantity|
      product = Product.find(product_id)
      [product, quantity]
    end
  end
end
