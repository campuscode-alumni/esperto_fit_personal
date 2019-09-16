require 'rails_helper'

feature 'Visitor access units list' do
  scenario 'and view empty list' do
    user = create(:customer)
    create(:profile, account: user)

    #Act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'

    expect(page).to have_content('Nenhuma Unidade Disponível no Momento')
  end

  scenario 'successfully' do
    create(:unit)
    create(:unit)
    create(:unit)
    lista = Unit.all
    user = create(:customer)
    create(:profile, account: user)
    #Act
    login_as(user, scope: :account)

    visit root_path
    click_on 'Unidades Disponíveis'

    expect(page).to have_css('h2', text: 'Unidades Disponíveis')
    expect(page).to have_css('li', text: lista[0].name)
    expect(page).to have_css('li', text: lista[1].name)
    expect(page).to have_css('li', text: lista[2].name)
  end

  scenario 'and sees unit details' do
    #Arrange
    create(:unit)
    create(:unit)
    lista = Unit.all
    user = create(:customer)
    #Act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on lista[0].name

    #Assert
    expect(current_path).to eq unit_path(lista[0])
    expect(page).to have_css('h2', text: lista[0].name)
  end
end
