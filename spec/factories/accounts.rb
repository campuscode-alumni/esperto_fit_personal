FactoryBot.define do
  factory :account do
    name { "João Silva" }
    sequence :email do |n|
      "email#{n}@generico.com" 
    end
    password { "123456"}
    type { "Customer"}

    factory :personal do
      type { "Personal" }
    end

    factory :customer do
      type { "Customer" }
    end
  end
end
