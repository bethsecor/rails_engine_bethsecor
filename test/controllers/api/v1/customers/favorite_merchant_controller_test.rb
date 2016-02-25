require 'test_helper'

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionController::TestCase
  test "customers favorite_merchant #show" do
    customer = create(:customer_with_invoices)
    get :show, customer_id: customer.id, format: :json

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal ["id", "name"], merchant.keys
  end
end
