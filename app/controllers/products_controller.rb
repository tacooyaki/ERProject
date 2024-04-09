class ProductsController < ApplicationController
  def index
    # Gets all the products
    @products = Product.all

    # Applies a filter by category IF a category_id is provided
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @products.where(category: @category)
    end

    # This lets you filter by keyword search
    if params[:search].present?
      @products = @products.where("name ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # Some more filters, this time based on query params
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

  # Removed as search functionality will be carried out in the index method instead.
  # This conforms to a Rails-conventional approach by keeping it DRY.
  #
  # def search
  #   @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
  #   render :index
  # end

  def show
    @product = Product.find(params[:id])
  end
end