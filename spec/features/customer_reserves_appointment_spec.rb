require 'rails_helper'

feature 'Customer view personal list' do
  scenario 'view personals for unit' do
    unit = create(:unit)
    personal = create(:personal, document: '12345678901')
    create(:profile, first_name: 'Personal 1', account: personal)
    second_personal = create(:personal, document: '12345678902')
    create(:profile, first_name: 'Personal 2', account: second_personal)
    third_personal = create(:personal, document: '12345678903')
    create(:profile, first_name: 'Personal 3', account: third_personal)
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
