class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    merchant = Customer.find(params[:customer_id]).favorite_merchant
    respond_with ({ id: merchant.id, name: merchant.name })
  end
end
