require 'test_helper'

class Api::V1::Invoices::ItemsControllerTest < ActionController::TestCase
  test "invoice items #index" do
    invoice = create(:invoice_with_invoice_items)
    get :index, invoice_id: invoice.id, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, items.length
  end
end
