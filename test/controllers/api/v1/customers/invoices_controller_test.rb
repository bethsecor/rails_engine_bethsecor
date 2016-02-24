require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "customers invoices #index" do
    customer = create(:customer_with_invoices)
    get :index, customer_id: customer.id, format: :json

    invoices = JSON.parse(response.body)

    assert_response :success
    assert_equal 2, invoices.length
  end
end
