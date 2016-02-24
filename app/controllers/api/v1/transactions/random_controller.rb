class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json

  def show
    ids = Transaction.pluck(:id)
    respond_with Transaction.find(ids.sample)
  end
end
