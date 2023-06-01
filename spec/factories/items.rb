FactoryBot.define do
  factory :item do
    name { "MyString" }
    outline { "MyText" }
    category_id { 1 }
    state_id { 1 }
    postage_id { 1 }
    prefecture_id { 1 }
    waiting_days_until_shipment_id { 1 }
    price { 1 }
    user { nil }
  end
end
