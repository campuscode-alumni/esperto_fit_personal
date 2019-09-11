require 'rails_helper'

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
    #click_on 'Matricular-se Nesta Unidade'
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
    # expect(page).to have_content('10h')
    # expect(page).to have_content('11h')
    # expect(page).to have_content('10/09/2019')
    # expect(page).to have_content('R$ 50,00')
    # expect(page).to have_link('Reservar Horário')
    # expect(page).to have_link('Voltar')

  end
end