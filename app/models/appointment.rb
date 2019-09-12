class Appointment < ApplicationRecord
  belongs_to :account
  belongs_to :schedule
  has_one :customer, through: :customer_appointment
end