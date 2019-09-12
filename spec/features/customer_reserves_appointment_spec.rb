require 'rails_helper'

feature 'Customer view personal list' do
  scenario 'view personals for unit' do
    unit = create(:unit)
    personal = create(:personal, name: 'Personal 1')
    second_personal = create(:personal, name: 'Personal 2')
    third_personal = create(:personal, name: 'Personal 3')
    schedule = create(:schedule, personal: personal, unit: unit)
    schedule = create(:schedule, personal: second_personal, unit: unit)    
    user = create(:customer, unit: unit)
    login_as(user, scope: :account)
    visit root_path
    click_on 'Agendar horário com Personal'

    expect(page).to have_content('Personal 1')
    expect(page).to have_content('Personal 2')
    expect(page).not_to have_content('Personal 3')
  end

end