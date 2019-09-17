class Appointment < ApplicationRecord
  belongs_to :account
  belongs_to :schedule
  has_one :customer, through: :customer_appointment

  def has_owner?
    if CustomerAppointment.find(self.id).account_id
      return true
    end
    return false
  end
end
