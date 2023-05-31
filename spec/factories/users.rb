FactoryBot.define do
  factory :user do   
    nickname                  {Faker::Name.initials}
    email                     {Faker::Internet.free_email}
    password                  {'a1' + Faker::Internet.password(min_length: 4)}
    password_confirmation     {password}
    last_name                 {Faker::Name.last_name}
    first_name                {Faker::Name.first_name}
    last_name_pronunciation   {"ラストネーム"}
    first_name_pronunciation  {"ファーストネーム"}
    birthday                  {"2000-10-20"} 
  end
end
