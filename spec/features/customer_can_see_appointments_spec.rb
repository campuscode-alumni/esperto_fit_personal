require 'rails_helper'

feature 'Customer can see apppointments' do
  scenario 'only if is authenticated' do
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    schedule.create_appointments
    
  
    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"
    click_on 'Patricia'

    expect(page).to have_css('h1', text: "Agenda da #{profile.first_name} para a data #{schedule.date}")
    expect(page).to have_css('li', text: "Horário das #{(schedule.appointments[0].start_hour)} às #{(schedule.appointments[0].finish_hour)} - Preço #{(schedule.price)}")
    expect(page).to have_css('li', text: "Horário das #{(schedule.appointments[1].start_hour)} às #{(schedule.appointments[1].finish_hour)} - Preço #{(schedule.price)}")


  end
  scenario 'only if is authenticated' do
    pending
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    
    login_as(customer, scope: :account)
  end
end