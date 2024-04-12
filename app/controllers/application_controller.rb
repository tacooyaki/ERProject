class ApplicationController < ActionController::Base
  before_action :initialize_cart
  # before_action :authenticate_user!, except: [:index, :show]

  private

  def initialize_cart
    session[:shopping_cart] ||= {}
  end
end
