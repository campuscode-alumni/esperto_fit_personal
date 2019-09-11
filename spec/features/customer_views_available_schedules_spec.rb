require 'rails_helper'
#Corrigir a rota(mudar de Appointment p/ Schedule)
feature 'Customer can see Personal schedules' do
  scenario 'Successfully' do
    #Arrange
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')

    create(:schedule, date: '10/09/2019', start: 10, finish: 18, price: "50", account: account, unit: unit)
    
    #Act
    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on 'Unidade 1'
    click_on "Personals na Unidade 1"

    #Assert
    expect(page).to have_css('th', text: "Personal")
    expect(page).to have_css('tr', text: "#{profile.first_name}")
    expect(page).to have_css('th', text: "Data Disponível")
    expect(page).to have_css('tr', text: "#{unit.schedules[0].date}")
    expect(page).to have_css('th', text: "Horário de Atendimento")
    expect(page).to have_css('tr', text: "#{unit.schedules[0].start} às #{unit.schedules[0].finish}")
    expect(page).to have_css('th', text: "Valor")
    expect(page).to have_css('tr', text: "#{unit.schedules[0].price}")


  end

  scenario 'and there are no schedules in his unit' do
    unit = create(:unit)
    customer = create(:customer, unit: unit)

    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'

  end

  scenario 'and customer is not yet registered at a unit' do

  end

  scenario '' do

  end
end