FactoryBot.define do
  factory :profile do
    first_name { "João" }
    last_name { "Silva" }
    date_of_birth { "2019-09-03" }
    gender { 1 }
    address { "rua abacaxi" }
    contact { "12341234" }
    nickname { "jojo" }
    payment_method { "cartão de credito" }
    account

    trait :personal do
      work_document { '123456' }
      account { create(:personal) }
    end
  end
end
