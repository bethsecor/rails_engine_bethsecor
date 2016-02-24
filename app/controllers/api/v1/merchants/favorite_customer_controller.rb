class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    customer = Merchant.find(params[:merchant_id])
                       .invoices.joins(:transactions)
                       .where("transactions.result = ?", "success")
                       .joins(:customer)
                       .group(:customer)
                       .order(count: :desc)
                       .count.first.first
    respond_with ({ id: customer.id })
  end
end
