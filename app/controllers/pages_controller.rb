class PagesController < ApplicationController
  def show
    @page = StaticPage.find_by(slug: params[:slug])
    unless @page
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end
