require 'rails_helper'

feature 'Customer view all available units' do
  scenario 'View all units' do
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
end