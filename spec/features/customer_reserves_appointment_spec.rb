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
    click_on "Horário das 11h às 12h - Preço 50"

    #Assert
    expect(page).to have_content('Aula agendada com sucesso. Veja mais detalhes em sua área do aluno!')
  end

end