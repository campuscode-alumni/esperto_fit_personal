require 'rails_helper'

feature 'Customer can reserve an appointment with a personal' do
  scenario 'succesfully' do
    #Arrange
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    schedule.create_appointments
    
    #Act
    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"
    click_on 'Patricia' 

    #Assert
    expect(page).to have_css('h1', text: "Agenda da #{profile.first_name} para a data #{schedule.date}")
    expect(page).to have_link('li', text: "Horário das #{(schedule.appointments[0].start_hour)} às #{(schedule.appointments[0].end_hour)} - Preço #{(schedule.price)}")
  end

end