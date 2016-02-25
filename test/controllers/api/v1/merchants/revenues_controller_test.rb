require 'test_helper'

class Api::V1::Merchants::RevenuesControllerTest < ActionController::TestCase
  test "merchants revenue #show" do
    merchant = create(:merchant_with_invoices)
    get :show, merchant_id: merchant.id, format: :json

    revenue = JSON.parse(response.body)

    assert_response :success
    assert_equal ["revenue"], revenue.keys
  end

  test "merchants revenue with date #show" do
    merchant = create(:merchant_with_invoices)
    get :show, merchant_id: merchant.id, date: "2012-03-27 14:54:09 UTC", format: :json

    revenue = JSON.parse(response.body)

    assert_response :success
    assert_equal ["revenue"], revenue.keys
  end
end
