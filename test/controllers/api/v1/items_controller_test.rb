require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    item = create(:item)
    get :index, format: :json

    items_r = JSON.parse(response.body)
    item_r = items_r.last

    assert_response :success
    assert_equal item.name, item_r['name']
    assert_equal item.description, item_r['description']
    assert_equal item.unit_price.to_s, item_r['unit_price']
    assert_equal item.merchant_id, item_r['merchant_id']
    assert_equal item.created_at, item_r['created_at']
    assert_equal item.updated_at, item_r['updated_at']
  end

  test "#show" do
    item = create(:item)
    get :show, id: item.id, format: :json

    item_r = JSON.parse(response.body)

    assert_response :success
    assert_equal item.name, item_r['name']
    assert_equal item.description, item_r['description']
    assert_equal item.unit_price.to_s, item_r['unit_price']
    assert_equal item.merchant_id, item_r['merchant_id']
    assert_equal item.created_at, item_r['created_at']
    assert_equal item.updated_at, item_r['updated_at']
  end
end
