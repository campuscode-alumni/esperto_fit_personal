FactoryBot.define do
  factory :customer, class: Customer do
    name { "Aluno Genérico" }
    sequence :email do |n|
      "aluno#{n}@generico.com" 
    end
    password { "123456"}
    type { "Customer"}
  end
  factory :personal, class: Personal do
    name { "Personal Genérico" }
    sequence :email do |n|
      "personal#{n}@generico.com" 
    end
    password { "123456"}
    type { "Personal"}
  end
    
end
