FactoryBot.define do
  factory :account do
    document { "12345678900" }
    sequence :email do |n|
      "email#{n}@generico.com" 
    end
    password { "123456"}
    type { "Personal"}
    
  end
  factory :customer, class: Customer do
    document { "12345678900" }
    sequence :email do |n|
      "aluno#{n}@generico.com" 
    end
    password { "123456"}
    type { "Customer"}
    
  end
  factory :personal, class: Personal do
    document { "12345678900" }
    sequence :email do |n|
      "personal#{n}@generico.com" 
    end
    password { "123456"}
    type { "Personal"}
    
  end
end
