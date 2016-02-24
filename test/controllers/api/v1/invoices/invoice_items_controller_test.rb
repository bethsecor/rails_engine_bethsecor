require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "invoice invoice items #index" do
    invoice = create(:invoice_with_invoice_items)
    get :index, invoice_id: invoice.id, format: :json

    invoice_items = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, invoice_items.length
  end
end
