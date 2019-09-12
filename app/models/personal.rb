class Personal < Account
  has_many :schedules
  has_many :units, through: :schedules
end
