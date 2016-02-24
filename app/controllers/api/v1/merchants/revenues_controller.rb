class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    unless params[:date]
      respond_with( { revenue: Merchant.find(params[:merchant_id]).revenue } )
    else
      respond_with( { revenue: Merchant.find(params[:merchant_id]).revenue_by_date(params[:date]) } )
    end
  end
end
