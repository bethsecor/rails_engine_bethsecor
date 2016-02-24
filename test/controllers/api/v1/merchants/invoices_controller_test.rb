require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  test "merchant invoices #index" do
    merchant = create(:merchant_with_invoices)
    get :index, merchant_id: merchant.id, format: :json

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 4, invoices.length
  end
end
