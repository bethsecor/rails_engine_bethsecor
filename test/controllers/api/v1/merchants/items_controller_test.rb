require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "merchant items #index" do
    merchant = create(:merchant_with_items)
    get :index, merchant_id: merchant.id, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, items.length
  end
end
