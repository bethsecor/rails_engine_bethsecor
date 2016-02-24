require 'test_helper'

class Api::V1::Invoices::RandomControllerTest < ActionController::TestCase
  test "find random" do
    invoice = create(:invoice)
    get :show, format: :json

    invoice_r = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice.customer_id, invoice_r['customer_id']
    assert_equal invoice.merchant_id, invoice_r['merchant_id']
    assert_equal invoice.status, invoice_r['status']
    assert_equal invoice.created_at, invoice_r['created_at']
    assert_equal invoice.updated_at, invoice_r['updated_at']
  end
end
