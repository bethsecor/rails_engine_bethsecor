require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    customer = create(:customer)
    get :index, format: :json

    customers_r = JSON.parse(response.body)
    customer_r = customers_r.last

    assert_response :success
    assert_equal customer.first_name, customer_r['first_name']
    assert_equal customer.last_name, customer_r['last_name']
    assert_equal customer.created_at, customer_r['created_at']
    assert_equal customer.updated_at, customer_r['updated_at']
  end

  test "#show" do
    customer = create(:customer)
    get :show, id: customer.id, format: :json

    customer_r = JSON.parse(response.body)

    assert_response :success
    assert_equal customer.first_name, customer_r['first_name']
    assert_equal customer.last_name, customer_r['last_name']
    assert_equal customer.created_at, customer_r['created_at']
    assert_equal customer.updated_at, customer_r['updated_at']
  end
end
