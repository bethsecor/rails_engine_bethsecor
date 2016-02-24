require 'test_helper'

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "invoice item invoice #show" do
    invoice_item = create(:invoice_item)
    get :show, invoice_item_id: invoice_item.id, format: :json

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice_item.invoice.status, invoice['status']
  end
end
