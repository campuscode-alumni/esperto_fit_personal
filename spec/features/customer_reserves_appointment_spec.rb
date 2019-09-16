require 'rails_helper'

feature 'Customer can reserve an appointment' do
  scenario 'with a personal' do
    #Arrange
    unit = create(:unit)
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account, first_name: 'Patricia')
    schedule = create(:schedule, personal: account, unit: unit)
    user = create(:customer, unit: unit)
    login_as(user, scope: :account)

    #Act
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"
    click_on "#{profile.first_name}"
    click_on "Horário das 10 às 11h - Preço 50"

    #Assert
    expect(page).to have_content('Aula agendada com sucesso!')

  end

end
