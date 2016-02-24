require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "items invoice items #index" do
    invoice_item = create(:invoice_item)
    item = invoice_item.item
    get :index, item_id: item.id, format: :json

    invoice_item_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal invoice_item.quantity, invoice_item_r['quantity']
  end
end
