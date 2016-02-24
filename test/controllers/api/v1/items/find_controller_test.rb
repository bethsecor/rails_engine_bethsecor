require 'test_helper'

class Api::V1::Items::FindControllerTest < ActionController::TestCase
  test "find by name" do
    item = create(:item)
    get :show, name: item.name, format: :json

    item_r = JSON.parse(response.body)

    assert_response :success
    assert_equal item.name, item_r['name']
    assert_equal item.description, item_r['description']
    assert_equal item.unit_price.to_s, item_r['unit_price']
    assert_equal item.merchant_id, item_r['merchant_id']
    assert_equal item.created_at, item_r['created_at']
    assert_equal item.updated_at, item_r['updated_at']
  end

  test "find all by name" do
    item = create(:item)
    get :index, name: item.name, format: :json

    item_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal item.name, item_r['name']
    assert_equal item.description, item_r['description']
    assert_equal item.unit_price.to_s, item_r['unit_price']
    assert_equal item.merchant_id, item_r['merchant_id']
    assert_equal item.created_at, item_r['created_at']
    assert_equal item.updated_at, item_r['updated_at']
  end
end
