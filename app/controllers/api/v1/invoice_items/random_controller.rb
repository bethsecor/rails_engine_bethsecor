class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json

  def show
    ids = InvoiceItem.pluck(:id)
    respond_with InvoiceItem.find(ids.sample)
  end
end
