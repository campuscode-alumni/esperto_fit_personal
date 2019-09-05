FactoryBot.define do
  factory :account do
    name { "Nome Generico" }
    email { "email@generico.com" }
    password { "123456"}
    type { "Customer"}

    factory :personal do
      type { "Personal"}
    end
  end
end
