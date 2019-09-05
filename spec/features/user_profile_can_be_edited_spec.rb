require 'rails_helper'

feature 'User profile can be edited' do
  scenario 'successfuly' do
    pending
    #Arrange
    profile = create(:profile, :personal)
    
    #Act
    login_as profile.account, scope: :account
    visit root_path

    click_on profile.nickname

    #expect(page).to have_content('João Silva')
    expect(profile.first_name).to eq 'João'
  end
end