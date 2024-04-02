class ProductsController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end

    @products = @products.on_sale if params[:on_sale].present?
    @products = @products.recently_added if params[:newly_added].present?

    if params[:recently_updated].present? && !params[:newly_added].present?
      @products = @products.recently_updated
    end
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    render :index
  end

  def show
    @product = Product.find(params[:id])
  end
end