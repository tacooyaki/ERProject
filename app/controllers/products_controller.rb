class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @products.where(category: @category)
    end

    if params[:search].present?
      @products = @products.where("name ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    @products = @products.on_sale if params[:on_sale] == '1'
    @products = @products.recently_added if params[:newly_added].present?

    # This meets the "recently updated" to not include "newly added" requirements
    # It applies to products if both filters are applied
    if params[:recently_updated].present? && !params[:newly_added].present?
      @products = @products.recently_updated
    end

    # Pagination
    @products = @products.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end
end