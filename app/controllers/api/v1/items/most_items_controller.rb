class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json

  def index
    # returns the top x items ranked by total number sold
    items = Invoice.joins(:transactions)
           .where("transactions.result = ?", "success")
           .joins(:invoice_items)
           .group(:item_id)
           .order("sum(quantity) desc")
           .sum("quantity")
           .take(params[:quantity].to_i)

    top_items = items.map {|id, rev| {id: id, name: Item.find(id).name } }
    respond_with(top_items)
  end
end
