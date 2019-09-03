FactoryBot.define do
  factory :profile do
    document { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    date_of_birth { "2019-09-03" }
    gender { 1 }
    address { "MyText" }
    contact { "MyString" }
    nickname { "MyString" }
    payment_method { "MyString" }
  end
end
