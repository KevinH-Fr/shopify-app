class ApplicationController < ActionController::Base

    before_action :activate_shopify_session

    private

    def activate_shopify_session
    session = ShopifyAPI::Auth::Session.new(
        shop: "racemeifyoucan.myshopify.com",
        access_token: ENV.fetch("SHOPIFY_API_TOKEN")
    )

    ShopifyAPI::Context.activate_session(session)
    ShopifyAPI::Context.load_rest_resources(api_version: "2023-10")
    end
    
end
