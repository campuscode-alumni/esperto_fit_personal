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
        
end
