FactoryBot.define do
  factory :unit do
    sequence :name do |n|
      "Unidade #{n}"
    end
    sequence :ex_gym_ref do |n|
      n
    end
  end
end
