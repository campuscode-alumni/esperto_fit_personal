require 'rails_helper'

feature 'Customer view all available units' do
  scenario 'Successfully' do
    #Arrange
    customer = create(:customer, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: customer, first_name: 'Joao')
    
    #Act
    login_as(customer, scope: :account)
    visit root_path
    
    #Assert
    expect(page).to have_content('Academia Madalena')
    expect(page).to have_content('Academia Consolação')
    expect(page).to have_content('Academia Paulista')
  end

  scenario 'and can sign up to a unity' do
    customer = create(:customer, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: customer, first_name: 'Joao')
    login_as(customer, scope: :account)

    visit root_path
    within('div.academia-1') do
      click_on 'Cadastrar Nesta Unidade'
    end

    within('div.academia-1') do
      expect(page).not_to have_link('Cadastrar Nesta Unidade')
    end
    within('div.academia-2') do
      expect(page).to have_link('Mudar para está Unidade')
      expect(page).not_to have_link('Cadastrar Nesta Unidade')
    end
    within('div.academia-3') do
      expect(page).to have_link('Mudar para está Unidade')
      expect(page).not_to have_link('Cadastrar Nesta Unidade')
    end
  end
end