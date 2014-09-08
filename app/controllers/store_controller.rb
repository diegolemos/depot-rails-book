class StoreController < ApplicationController
  def index

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] = session[:counter] + 1
    end

    @page_counter = session[:counter]

    @products = Product.order(:title)

  end
end
