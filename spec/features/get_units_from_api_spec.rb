require 'rails_helper'

feature 'Get units from the gym API' do
  scenario 'Successfully'do
    visit root_path
    resp = Gym.all 
    expect(page).to have_content(resp[0][:name])
    expect(page).to have_content(resp[1][:name])
    expect(page).to have_content(resp[1][:name])
  end

end
