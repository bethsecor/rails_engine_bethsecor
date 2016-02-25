require 'test_helper'

class Api::V1::Items::RevenuesControllerTest < ActionController::TestCase
  test "items revenue #index" do
    item = create(:invoice_item).item
    get :index, item_id: item.id, quantity: 1, format: :json

    item_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal ["id", "name"], item_r.keys
  end
end
