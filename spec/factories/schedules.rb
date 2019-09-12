FactoryBot.define do
  factory :schedule do
    unit
    personal
    date { "MyString" }
    start { 7 }
    finish { 20 }
    price { "50" }
  end
end
