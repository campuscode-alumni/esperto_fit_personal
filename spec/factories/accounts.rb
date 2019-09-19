FactoryBot.define do
  factory :account do
    sequence :document do |n|
      "1234567890#{n}"
    end
    sequence :email do |n|
      "email#{n}@generico.com"
    end
    password { "123456"}
    type { "Personal"}

  end
  factory :customer, class: Customer do
    sequence :document do |n|
      "2234567890#{n}"
    end
    sequence :email do |n|
      "aluno#{n}@generico.com"
    end
    password { "123456"}
    type { "Customer"}

  end
  factory :personal, class: Personal do
    sequence :document do |n|
      "3234567890#{n}"
    end
    sequence :email do |n|
      "personal#{n}@generico.com"
    end
    password { "123456"}
    type { "Personal"}

  end
end
