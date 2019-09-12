class Customer < Account
  has_one :unit, through: :enrollment
end
