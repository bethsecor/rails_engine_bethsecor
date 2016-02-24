require 'csv'

namespace :import do
  desc "Import sales engine csv files"
  task csvs: :environment do
    customers_filename = File.join Rails.root, "support/customers.csv"
    CSV.foreach(customers_filename, :headers => true) do |row|
      Customer.create!(row.to_h)
    end

    merchants_filename = File.join Rails.root, "support/merchants.csv"
    CSV.foreach(merchants_filename, :headers => true) do |row|
      Merchant.create!(row.to_h)
    end

    items_filename = File.join Rails.root, "support/items.csv"
    CSV.foreach(items_filename, :headers => true) do |row|
      Item.create!(row.to_h)
    end

    invoices_filename = File.join Rails.root, "support/invoices.csv"
    CSV.foreach(invoices_filename, :headers => true) do |row|
      Invoice.create!(row.to_h)
    end

    invoice_items_filename = File.join Rails.root, "support/invoice_items.csv"
    CSV.foreach(invoice_items_filename, :headers => true) do |row|
      InvoiceItem.create!(row.to_h)
    end

    transactions_filename = File.join Rails.root, "support/transactions.csv"
    CSV.foreach(transactions_filename, :headers => true) do |row|
      Transaction.create!(row.to_h.except("credit_card_expiration_date"))
    end
  end
end
