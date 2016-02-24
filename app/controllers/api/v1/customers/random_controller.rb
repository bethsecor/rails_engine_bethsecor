class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json

  def show
    ids = Customer.pluck(:id)
    respond_with Customer.find(ids.sample)
  end
end
