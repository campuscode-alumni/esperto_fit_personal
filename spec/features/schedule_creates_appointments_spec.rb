require 'rails_helper'

feature 'Schedule creates appointments' do
  scenario 'When a schedule is created, it should create appointments based on start and finish hours' do
    #Arrange
    schedule = create(:schedule)

    #Act
    schedule.create_appointments
    
    #Assert
    expect(Appointment.last.account.type).to eq schedule.account.type
  end
end