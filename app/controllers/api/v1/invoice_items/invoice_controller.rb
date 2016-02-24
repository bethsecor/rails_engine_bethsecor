class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:invoice_item_id]).invoice
  end
end
