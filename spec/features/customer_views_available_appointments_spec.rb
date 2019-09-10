require 'rails_helper'

feature 'Customer can see appointments' do
  scenario 'can only see appointments if signed in' do
    pending
    #Arrange
    customer = create(:customer)
    personal = create(:personal)
    unit = create(:unit)
    create(:schedule, date: '10/09/2019', start: 10, finish: 18, price: "50", account: personal, unit: unit)

    #Act
    login_as(customer)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on 'Unidade 1'
    click_on "Aulas disponíveis na Unidade 1"

    #Assert
    expect(page).to have_css('p', text: 'Aula com Personal')
    expect(page).to have_content('10h')
    expect(page).to have_content('11h')
    expect(page).to have_content('10/09/2019')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_link('Reservar Horário')
    expect(page).to have_link('Voltar')

  end
end