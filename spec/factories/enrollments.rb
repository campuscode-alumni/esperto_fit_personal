FactoryBot.define do
  factory :enrollment do
    unit {create(:unit)}
    account {create(:customer)}
  end
end
