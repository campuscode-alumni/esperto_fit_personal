require 'rails_helper'

feature 'Customer can see his payments' do
  before(:each) { list_gyms }
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

      expect(current_page).to eq payments_profile_path
      expect(page).to have_css('h3', text: 'Pagamentos de Marta')
    end
end