FactoryBot.define do
  factory :destination do
    post_code { "MyString" }
    prefecture_id { 1 }
    municipality { "MyString" }
    address { "MyString" }
    building { "MyString" }
    telephone_number { "MyString" }
    purchase { nil }
  end
end
