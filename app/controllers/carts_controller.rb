class CartsController < ApplicationController
  def add_to_cart
    product_id = params[:product_id]
    session[:shopping_cart][product_id] ||= 0
    session[:shopping_cart][product_id] += 1
    redirect_to cart_path, notice: "Product added to cart."
  end

  def update_cart_item
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:shopping_cart][product_id] = quantity
    else
      session[:shopping_cart].delete(product_id)
    end
    redirect_to cart_path, notice: "Cart updated."
  end

  def remove_from_cart
    product_id = params[:product_id]
    session[:shopping_cart].delete(product_id)
    redirect_to cart_path, notice: "Item removed from cart."
  end

  def show
    @cart_items_with_products = {}
    session[:shopping_cart].each do |product_id, quantity|
      product = Product.find(product_id)
      @cart_items_with_products[product] = quantity
    end
  rescue ActiveRecord::RecordNotFound => e
    logger.error "Product not found: #{e}"
  end

end
