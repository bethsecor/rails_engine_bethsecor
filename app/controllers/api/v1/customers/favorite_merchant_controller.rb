class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    # returns a merchant where the customer has conducted the most successful transactions
    merchant = Customer.find(params[:customer_id]).invoices
                         .joins(:transactions)
                         .where("transactions.result = ?", "success")
                         .joins(:merchant)
                         .group(:merchant).order(count: :desc).count.first.first
    respond_with ({ id: merchant.id, name: merchant.name })
  end
end
