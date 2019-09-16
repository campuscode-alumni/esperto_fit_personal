FactoryBot.define do
  factory :appointment do
    account
    available { false }
    start_hour { 13 }
    end_hour { 14 }
    date_appointment { "2019-09-10" }
  end
end
