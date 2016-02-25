class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:merchant_id])
    unless params[:date]
      respond_with( { revenue: merchant.revenue } )
    else
      respond_with( { revenue: merchant.revenue_by_date(params[:date]) } )
    end
  end
end
