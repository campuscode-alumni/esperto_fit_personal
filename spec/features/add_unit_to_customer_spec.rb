require 'rails_helper'

feature 'Add unit to customer' do
  scenario 'successfully' do
    #arrange
    unit = create(:unit, name: 'Paulista')
    user = create(:customer)
    create(:profile, account: user)
    #act
    login_as(user, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on 'Matricular-se Nesta Unidade'

    #assert
    expect(page).to have_content('Matricula realizada com sucesso')
    expect(page).to have_content("Você é membro desta unidade")
    expect(current_path).to eq unit_path(unit)
    expect(user.unit.id).to eq unit.id
  end

  scenario 'if signed user is as personal it should redirect to root_path' do
    #Arrange
    unit = create(:unit, name: 'Paulista')
    account = create(:personal)
    profile = create(:profile, account: account)

    #Act
    login_as(account, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    visit unit_path(unit)
    click_on 'Matricular-se Nesta Unidade'

    #Assert
    expect(current_path).to eq root_path
  end
end
