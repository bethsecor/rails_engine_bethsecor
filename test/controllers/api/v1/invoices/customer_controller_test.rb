require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "invoice customer #show" do
    invoice = create(:invoice)
    get :show, invoice_id: invoice.id, format: :json

    customer = JSON.parse(response.body)

    assert_response :success
    assert_equal invoice.customer.first_name, customer['first_name']
  end
end
