class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    customer = Merchant.find(params[:merchant_id]).favorite_customer
    respond_with ({ id: customer.id })
  end
end
