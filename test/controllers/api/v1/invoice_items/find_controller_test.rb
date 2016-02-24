require 'test_helper'

class Api::V1::InvoiceItems::FindControllerTest < ActionController::TestCase
  test "find by unit_price" do
    invoice_item = create(:invoice_item)
    get :show, unit_price: invoice_item.unit_price, format: :json

    invoice_item_r = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item.item_id, invoice_item_r['item_id']
    assert_equal invoice_item.invoice_id, invoice_item_r['invoice_id']
    assert_equal invoice_item.quantity, invoice_item_r['quantity']
    assert_equal invoice_item.unit_price.to_s, invoice_item_r['unit_price']
    assert_equal invoice_item.created_at, invoice_item_r['created_at']
    assert_equal invoice_item.updated_at, invoice_item_r['updated_at']
  end

  test "find all by unit_price" do
    invoice_item = create(:invoice_item)
    get :index, unit_price: invoice_item.unit_price.to_s, format: :json

    invoice_item_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal invoice_item.item_id, invoice_item_r['item_id']
    assert_equal invoice_item.invoice_id, invoice_item_r['invoice_id']
    assert_equal invoice_item.quantity, invoice_item_r['quantity']
    assert_equal invoice_item.unit_price.to_s, invoice_item_r['unit_price']
    assert_equal invoice_item.created_at, invoice_item_r['created_at']
    assert_equal invoice_item.updated_at, invoice_item_r['updated_at']
  end
end
