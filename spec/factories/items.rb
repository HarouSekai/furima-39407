FactoryBot.define do
  factory :item do
    name { 'MyString' }
    outline { 'MyText' }
    category_id { 2 }
    state_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    waiting_days_until_shipment_id { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.png'), filename: 'test.png')
    end
  end
end
