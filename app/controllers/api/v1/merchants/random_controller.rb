class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json

  def show
    ids = Merchant.pluck(:id)
    respond_with Merchant.find(ids.sample)
  end
end
