require 'rails_helper'

feature 'Customer can reserve an appointment' do
  scenario 'with a personal' do
    #Arrange
    unit = create(:unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, start: 10, finish: 11, personal: account, unit: unit)
    schedule.create_appointments
    user = create(:customer, unit: unit)
    login_as(user, scope: :account)

    #Act
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"
    click_on "#{profile.first_name}"
    click_on "Escolher essa aula" # - Horário das 10 às 11h - Preço 50"

    #Assert
    expect(page).to have_content('Aula agendada com sucesso!')

  end
  scenario 'and can\'t select taken class' do
    unit = create(:unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, start: 10, finish: 12, personal: account, unit: unit)
    schedule.create_appointments
    user = create(:customer, unit: unit)
    cp = CustomerAppointment.find(schedule.appointments[0].id)
    cp.account = user
    cp.save

    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"
    click_on "#{profile.first_name}"

    expect(page).to have_content('Aula Indisponivel')

  end

end
