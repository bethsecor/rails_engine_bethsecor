class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def revenue
    self.invoices.joins(:transactions)
                 .where("transactions.result = ?", "success")
                 .joins(:invoice_items)
                 .sum("unit_price * quantity")
  end

  def revenue_by_date(date)
    self.invoices.where(created_at: date)
                 .joins(:transactions)
                 .where("transactions.result = ?", "success")
                 .joins(:invoice_items)
                 .sum("unit_price * quantity")
  end

  def favorite_customer
    invoices.joins(:transactions)
    .where("transactions.result = ?", "success")
    .joins(:customer)
    .group(:customer)
    .order(count: :desc)
    .count.first.first
  end
end
