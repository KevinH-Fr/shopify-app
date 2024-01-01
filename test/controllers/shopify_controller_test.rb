require "test_helper"

class ShopifyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopify_index_url
    assert_response :success
  end
end
