require 'rails_helper'

feature 'Customer can see apppointments' do
  scenario 'Successfully' do
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
    expect(page).to have_css('li', text: "Horário das #{(schedule.appointments[0].start_hour)} às #{(schedule.appointments[0].end_hour)} - Preço #{(schedule.price)}")
    expect(page).to have_css('li', text: "Horário das #{(schedule.appointments[1].start_hour)} às #{(schedule.appointments[1].end_hour)} - Preço #{(schedule.price)}")
  end

  scenario 'and can\'t access other units through direct link' do 
    unit = create(:unit)
    other_unit = create(:unit)

    customer_account = create(:customer, email: 'other@email.com', password: '123456', unit: unit) 
    customer_profile = create(:profile, account: customer_account)
    
    personal_account = create(:personal, email: 'teste@email.com', password: '123456')
    personal_profile = create(:profile, account: personal_account, first_name: 'Patricia')

    schedule = create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: personal_account, unit: unit)
    other_schedule = create(:schedule, date: '11/09/2019', start: 10, finish: 12, price: "50", personal: personal_account, unit: other_unit)
    
    #byebug
    schedule.create_appointments
    other_schedule.create_appointments

    #byebug
    login_as(customer_account, scope: :account) 
    visit view_appointment_path(other_unit)

    expect(current_path).to eq root_path
  end

  scenario 'and must be logged in' do
    unit = create(:unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, date: '10/09/2019', start: 10, finish: 12, price: "50", personal: account, unit: unit)
    schedule.create_appointments
  
    visit root_path
    visit appointment_path(schedule)

    expect(current_path).to eq new_account_session_path
  end
end
