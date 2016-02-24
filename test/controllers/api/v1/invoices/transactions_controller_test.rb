require 'test_helper'

class Api::V1::Invoices::TransactionsControllerTest < ActionController::TestCase
  test "invoice transactions #index" do
    invoice = create(:invoice_with_transactions)
    get :index, invoice_id: invoice.id, format: :json

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 5, transactions.length
  end
end
