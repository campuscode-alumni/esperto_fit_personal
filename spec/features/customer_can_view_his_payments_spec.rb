require 'rails_helper'

feature 'Customer can see his payments' do
  before(:each) { list_gyms }
  before(:each) { list_payments }
  scenario '1: he must be signed in to see payments' do
    user = create(:customer)
    profile = create(:profile, account: user, first_name: 'Marta')

    login_as(user, scope: :account)
    visit root_path
    within('li#ola') do
      click_on profile.first_name
    end

    expect(page).to have_link('Meus Pagamentos')
    end
    
    scenario 'and can see payment page' do
      user = create(:customer)
      profile = create(:profile, account: user, first_name: 'Marta')
      login_as(user, scope: :account)
      
      visit root_path
      within('li#ola') do
        click_on profile.first_name
      end
      click_on 'Meus Pagamentos'

      expect(page).to have_content('Valor')
      expect(page).to have_content('Vencimento')
      expect(page).to have_content('Status')
    end
end