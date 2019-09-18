class Schedule < ApplicationRecord
  belongs_to :personal, foreign_key: 'account_id'

  has_many :appointments

  validates :date, :start, :finish, :price, :account_id, presence: true
  validates :price, numericality: { greater_than: 0 }
  
  
  def create_appointments
    (self.start...self.finish).each do |start_time| 
      end_time = start_time + 1
      appoimtment = Appointment.create(date_appointment: self.date, start_hour: start_time, end_hour: end_time, available: false, account: self.personal, schedule: self)
      CustomerAppointment.create(appointment: appoimtment, name_class: "Aulas com Personal")
    end
  end
end
