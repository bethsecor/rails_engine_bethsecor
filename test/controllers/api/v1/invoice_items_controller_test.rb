require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    invoice_item = create(:invoice_item)
    get :index, format: :json

    invoice_items_r = JSON.parse(response.body)
    invoice_item_r = invoice_items_r.last

    assert_response :success
    assert_equal invoice_item.item_id, invoice_item_r['item_id']
    assert_equal invoice_item.invoice_id, invoice_item_r['invoice_id']
    assert_equal invoice_item.quantity, invoice_item_r['quantity']
    assert_equal invoice_item.unit_price.to_s, invoice_item_r['unit_price']
    assert_equal invoice_item.created_at, invoice_item_r['created_at']
    assert_equal invoice_item.updated_at, invoice_item_r['updated_at']
  end

  test "#show" do
  invoice_item = create(:invoice_item)
    get :show, id: invoice_item.id, format: :json

    invoice_item_r = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item.item_id, invoice_item_r['item_id']
    assert_equal invoice_item.invoice_id, invoice_item_r['invoice_id']
    assert_equal invoice_item.quantity, invoice_item_r['quantity']
    assert_equal invoice_item.unit_price.to_s, invoice_item_r['unit_price']
    assert_equal invoice_item.created_at, invoice_item_r['created_at']
    assert_equal invoice_item.updated_at, invoice_item_r['updated_at']
  end
end
