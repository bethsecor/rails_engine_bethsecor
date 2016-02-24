class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json

  def show
    ids = Invoice.pluck(:id)
    respond_with Invoice.find(ids.sample)
  end
end
