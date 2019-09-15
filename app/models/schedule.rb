class Schedule < ApplicationRecord
  belongs_to :unit
  belongs_to :personal, foreign_key: 'account_id'

  has_many :appointments

  validates :date, :start, :finish, :price, :unit_id, :account_id, presence: true
  validates :price, numericality: { greater_than: 0 }

  def create_appointments
    (self.start..self.finish).each do |time|

      appm = Appointment.create(date_appointment: self.date, start_hour: time, end_hour: time+1, available: false, account: self.personal, schedule: self)
      CustomerAppointment.create(appointment: appm, name_class: "Aulas com Personal")
    end
  end
end
