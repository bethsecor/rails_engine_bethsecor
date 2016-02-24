require 'test_helper'

class Api::V1::Transactions::FindControllerTest < ActionController::TestCase
  test "find by credit_card_number" do
    transaction = create(:transaction)
    get :show, credit_card_number: transaction.credit_card_number, format: :json

    transaction_r = JSON.parse(response.body)

    assert_response :success
    assert_equal transaction.invoice_id, transaction_r['invoice_id']
    assert_equal transaction.credit_card_number, transaction_r['credit_card_number']
    assert_equal transaction.result, transaction_r['result']
    assert_equal transaction.created_at, transaction_r['created_at']
    assert_equal transaction.updated_at, transaction_r['updated_at']
  end

  test "find all by credit_card_number" do
    transaction = create(:transaction)
    get :index, credit_card_number: transaction.credit_card_number, format: :json

    transaction_r = JSON.parse(response.body).first

    assert_response :success
    assert_equal transaction.invoice_id, transaction_r['invoice_id']
    assert_equal transaction.credit_card_number, transaction_r['credit_card_number']
    assert_equal transaction.result, transaction_r['result']
    assert_equal transaction.created_at, transaction_r['created_at']
    assert_equal transaction.updated_at, transaction_r['updated_at']
  end
end
