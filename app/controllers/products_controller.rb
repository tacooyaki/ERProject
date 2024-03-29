class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    render :index
  end

  def show
    @product = Product.find(params[:id])
  end
end