require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase
  test "item merchant #show" do
    item = create(:item)
    get :show, item_id: item.id, format: :json

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal item.merchant.name, merchant['name']
  end
end
