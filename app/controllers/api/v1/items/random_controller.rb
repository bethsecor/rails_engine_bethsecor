class Api::V1::Items::RandomController < ApplicationController
  respond_to :json

  def show
    ids = Item.pluck(:id)
    respond_with Item.find(ids.sample)
  end
end
