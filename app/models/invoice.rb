class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.most_items(number)
    joins(:transactions)
           .where("transactions.result = ?", "success")
           .joins(:invoice_items)
           .group(:item_id)
           .order("sum(quantity) desc")
           .sum("quantity")
           .take(number)
  end

  def self.most_revenue(number)
    joins(:transactions)
           .where("transactions.result = ?", "success")
           .joins(:invoice_items)
           .group(:item_id)
           .order("sum(unit_price * quantity) desc")
           .sum("unit_price * quantity")
           .take(number)
  end
end
