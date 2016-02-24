require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "transactions invoices #show" do
    transaction = create(:transaction)
    get :show, transaction_id: transaction.id, format: :json

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction.invoice.status, invoice['status']
  end
end
