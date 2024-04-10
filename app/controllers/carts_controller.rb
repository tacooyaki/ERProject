class CartsController < ApplicationController
  def add_to_cart
    product_id = params[:product_id].to_i
    product = { product_id: product_id, quantity: 1 }
    existing_product = session[:cart].find { |p| p[:product_id] == product_id }

    if existing_product
      existing_product[:quantity] += 1
    else
      session[:cart] << product
    end
    redirect_to products_path, notice: "Product added to cart."
  end

  def update_cart_item
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    cart_item = session[:cart].find { |item| item[:product_id] == product_id }
    cart_item[:quantity] = quantity if cart_item && quantity.positive?

    redirect_to cart_path
  end

  def remove_from_cart
    product_id = params[:product_id].to_i
    session[:cart].delete_if { |item| item[:product_id] == product_id }

    redirect_to cart_path, notice: "Item removed from cart."
  end

  def show
    @cart_products = session[:cart].map do |item|
      product = Product.find(item["product_id"])
      {
        product: product,
        quantity: item["quantity"]
      }
    end
  end

end
