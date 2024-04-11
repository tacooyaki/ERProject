class ApplicationController < ActionController::Base
  before_action :initialize_cart

  private

  def initialize_cart
    session[:shopping_cart] ||= {}
  end
end
