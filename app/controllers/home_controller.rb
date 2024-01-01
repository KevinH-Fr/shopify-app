class HomeController < ApplicationController
  def index

    @products = ShopifyAPI::Product.all

    @orders = ShopifyAPI::Order.all


  end
end
