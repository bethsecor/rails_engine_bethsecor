require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "customers transactions #index" do
    customer = create(:customer_with_invoices)
    get :index, customer_id: customer.id, format: :json

    transactions = JSON.parse(response.body)

    assert_response :success
    assert_equal 10, transactions.length
  end
end
