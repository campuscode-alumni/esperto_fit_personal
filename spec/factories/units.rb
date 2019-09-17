FactoryBot.define do
  factory :unit do
    sequence :name do |n|
      "Unidade #{n}"
    end
  end
end
