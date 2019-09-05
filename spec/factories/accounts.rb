FactoryBot.define do
  factory :account do
    name { "Nome Generico" }
    email { "email@generico.com" }
    password { "123456"}
    type { "Customer"}
  end
end
