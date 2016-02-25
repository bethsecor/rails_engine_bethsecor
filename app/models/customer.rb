class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    invoices
     .joins(:transactions)
     .where("transactions.result = ?", "success")
     .joins(:merchant)
     .group(:merchant).order(count: :desc).count.first.first
  end
end
