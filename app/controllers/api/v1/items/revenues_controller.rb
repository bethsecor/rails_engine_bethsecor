class Api::V1::Items::RevenuesController < ApplicationController
  respond_to :json

  def index
    items = Invoice.most_revenue(params[:quantity].to_i)
    
    top_items = items.map {|id, rev| {id: id, name: Item.find(id).name } }
    respond_with(top_items)
  end
end
