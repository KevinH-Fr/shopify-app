
# app/controllers/shopify_controller.rb
class ShopifyController < ApplicationController
  def index
    api_key = ENV['SHOPIFY_API_KEY']
    api_secret =  ENV['SHOPIFY_API_PASSWORD']
    shop_domain = 'racemeifyoucan.myshopify.com'

    # Initialize the Shopify API client
    ShopifyAPI::Base.site = "https://#{api_key}:#{api_secret}@#{shop_domain}/admin"

    # Test the connection
    begin
      shop = ShopifyAPI::Shop.current
      render plain: "Connected to Shopify! Shop name: #{shop.name}"
    rescue ActiveResource::UnauthorizedAccess
      render plain: "Unable to connect. Please check your API credentials."
    end
  end

end
