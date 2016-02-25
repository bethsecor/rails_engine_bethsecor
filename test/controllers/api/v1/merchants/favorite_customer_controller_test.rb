require 'test_helper'

class Api::V1::Merchants::FavoriteCustomerControllerTest < ActionController::TestCase
  test "merchants favorite_customer #show" do
    merchant = create(:merchant_with_invoices)
    get :show, merchant_id: merchant.id, format: :json

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal ["id"], customer.keys
  end
end
