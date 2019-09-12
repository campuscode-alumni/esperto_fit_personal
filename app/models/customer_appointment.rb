class CustomerAppointment < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :appointment
end
