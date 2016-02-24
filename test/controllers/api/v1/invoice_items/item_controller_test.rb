require 'test_helper'

class Api::V1::InvoiceItems::ItemControllerTest < ActionController::TestCase
  test "invoice item item #show" do
    invoice_item = create(:invoice_item)
    get :show, invoice_item_id: invoice_item.id, format: :json

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item.item.name, item['name']
  end
end
