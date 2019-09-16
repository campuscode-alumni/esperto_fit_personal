class CustomerAppointment < ApplicationRecord
  enum status: [:pending, :approved, :rejected]
  belongs_to :account, optional: true
  belongs_to :appointment
end
