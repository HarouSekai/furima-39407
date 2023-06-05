FactoryBot.define do
  factory :purchase_destination do
    post_code { '100-0001' }
    prefecture_id { 14 }
    municipality { '千代田区' }
    address { '千代田１－１' }
    building { '皇居' }
    telephone_number { '0312345678' }
  end
end
