require 'test_helper'

class Api::V1::Transactions::RandomControllerTest < ActionController::TestCase
  test "find random" do
    transaction = create(:transaction)
    get :show, format: :json

    transaction_r = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction.invoice_id, transaction_r['invoice_id']
    assert_equal transaction.credit_card_number, transaction_r['credit_card_number']
    assert_equal transaction.result, transaction_r['result']
    assert_equal transaction.created_at, transaction_r['created_at']
    assert_equal transaction.updated_at, transaction_r['updated_at']
  end
end
