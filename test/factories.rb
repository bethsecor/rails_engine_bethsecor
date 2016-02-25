FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"

    factory :customer_with_invoices do
      transient do
        invoice_count 2
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice_with_transactions, evaluator.invoice_count, customer: customer)
      end
    end
  end

  factory :merchant do
    sequence(:name) { |n| "merch_name#{n}" }
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"

    factory :merchant_with_items do
      transient do
        item_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.item_count, merchant: merchant)
      end
    end

    factory :merchant_with_invoices do
      transient do
        invoice_count 4
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice_with_transactions, evaluator.invoice_count, merchant: merchant)
      end
    end
  end

  factory :item do
    sequence(:name) { |n| "item_name#{n}" }
    description "item description"
    unit_price
    merchant
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end

  factory :invoice_item do
    item
    invoice
    sequence(:quantity) { |n| n }
    unit_price
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"

    factory :invoice_with_transactions do
      transient do
        transaction_count 5
      end

      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transaction_count, invoice: invoice)
      end
    end

    factory :invoice_with_invoice_items do
      transient do
        invoice_items_count 3
      end

      after(:create) do |invoice, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end

    # factory :invoice_with_items do
    #   transient do
    #     items_count 2
    #   end
    #
    #   after(:create) do |invoice, evaluator|
    #     create_list(:item, evaluator.items_count, invoice: invoice)
    #   end
    # end
  end

  factory :transaction do
    invoice
    sequence(:credit_card_number, (1..9).cycle) { |n| "465440541824963#{n}"}
    result "success"
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end

  sequence(:unit_price) { |n| 1000 + (n * 10 ) }
end
