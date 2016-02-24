require 'test_helper'

class Api::V1::Invoices::MerchantControllerTest < ActionController::TestCase
  test "invoice merchant #show" do
    invoice = create(:invoice)
    get :show, invoice_id: invoice.id, format: :json

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice.merchant.name, merchant['name']
  end
end
