require 'rails_helper'

feature 'Add unit to customer' do
  before(:each) do
    list_gyms
  end
  
  scenario 'successfully' do
    #arrange
    unit = JSON.parse((Faraday.get 'http://localhost:4000/api/v1/gyms').body, symbolize_names: true)
    user = create(:customer)
    create(:profile, account: user)
    #act
    login_as(user, scope: :account)
    visit root_path
    within("div.academia-1")do
      click_on 'Cadastrar Nesta Unidade'
    end

    #assert
    expect(page).to have_content('Matricula realizada com sucesso')
    within("div.academia-1")do
      expect(page).not_to have_content('Você é membro desta unidade') 
    end
    within("div.academia-2")do
      expect(page).not_to have_content('Mudar para está unidade') 
    end
    within("div.academia-3")do
      expect(page).not_to have_content('Mudar para está unidade') 
    end

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
