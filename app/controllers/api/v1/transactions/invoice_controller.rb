class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.find(params[:transaction_id]).invoice
  end
end
