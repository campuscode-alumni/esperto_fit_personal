FactoryBot.define do
  factory :schedule do
    date { "10-09-2019" }
    start { 10 }
    finish { 18 }
    price { "50" }
    account
    unit
  end
end
