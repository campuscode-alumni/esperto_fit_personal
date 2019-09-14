require 'rails_helper'

feature 'Units appear in homepage'do
  scenario 'Visitor visits home page and see all units' do
    unit = create(:unit)
    other_unit = create(:unit)

    visit root_path

    expect(page).to have_content(unit.name) 
    expect(page).to have_content(other_unit.name)
  end 
end
