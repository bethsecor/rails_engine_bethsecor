require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    invoice = create(:invoice)
    get :index, format: :json

    invoices_r = JSON.parse(response.body)
    invoice_r = invoices_r.last

    assert_response :success
    assert_equal invoice.customer_id, invoice_r['customer_id']
    assert_equal invoice.merchant_id, invoice_r['merchant_id']
    assert_equal invoice.status, invoice_r['status']
    assert_equal invoice.created_at, invoice_r['created_at']
    assert_equal invoice.updated_at, invoice_r['updated_at']
  end

  test "#show" do
    invoice = create(:invoice)
    get :show, id: invoice.id, format: :json

    invoice_r = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice.customer_id, invoice_r['customer_id']
    assert_equal invoice.merchant_id, invoice_r['merchant_id']
    assert_equal invoice.status, invoice_r['status']
    assert_equal invoice.created_at, invoice_r['created_at']
    assert_equal invoice.updated_at, invoice_r['updated_at']
  end
end
