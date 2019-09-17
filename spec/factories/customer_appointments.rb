FactoryBot.define do
  factory :customer_appointment do
    account { nil }
    appointment { nil }
    name_class { "MyString" }
  end
end
