require 'rails_helper'

RSpec.describe Appointment, type: :model do

  describe '#create_appointments' do
    it 'Create an appointment and accounts must be equal' do
      account = create(:personal)
      unit = create(:unit)
      schedule = Schedule.create!(date: "10-09-2019", price: "50", start: 10, finish: 18, personal: account, unit: unit)
      #create(:appointment)
      schedule.create_appointments

      #expect(Appointment.last.date_appointment).to eq "10-09-2019"
      expect(Appointment.last.account.type).to eq account.type
      expect(Appointment.last.account.email).to eq account.email
    end
  end

  describe 'has_owner? function' do
    it 'returns true when appointment has a customer'do 
      unit = create(:unit)

      customer_account = create(:customer, email: 'other@email.com', password: '123456', unit: unit) 
      customer_profile = create(:profile, account: customer_account)
      
      personal_account = create(:personal, email: 'teste@email.com', password: '123456')
      personal_profile = create(:profile, account: personal_account, first_name: 'Patricia')

      schedule = create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: personal_account, unit: unit) 
      schedule.create_appointments
      cp = CustomerAppointment.find(schedule.appointments[0].id)
      cp.account = customer_account
      cp.save
      expect(schedule.appointments[0].has_owner?).to eq true
      
    end

    it 'returns nil when no customer owns the appointment'do
      pending
    end
  end
end
