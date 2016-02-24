FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
  end

  factory :merchant do
    sequence(:name) { |n| "merch_name#{n}" }
    created_at "2012-03-27 14:54:09 UTC"
    updated_at "2012-03-27 14:54:09 UTC"
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
