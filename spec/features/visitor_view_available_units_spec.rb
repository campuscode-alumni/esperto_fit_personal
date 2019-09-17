require 'rails_helper'

feature 'visitor view units' do
  before(:each) do
    list_gyms
  end

  scenario 'sucessfully' do

    json_response = Gym.all
    visit root_path

    expect(page).to have_css('h3', text: 'Academia 01')
    expect(page).to have_css('p', text: "Funcionamento: de #{json_response[0][:working_days]}, das #{json_response[0][:open_hour]} às #{json_response[0][:close_hour]}")
    expect(page).to have_css('p', text: "#{json_response[0][:address]}")

    expect(page).to have_css('h3', text: 'Academia 02')
    expect(page).to have_css('p', text: "Funcionamento: de #{json_response[1][:working_days]}, das #{json_response[1][:open_hour]} às #{json_response[1][:close_hour]}")
    expect(page).to have_css('p', text: "#{json_response[1][:address]}")

    expect(page).to have_css('h3', text: 'Academia 03')
    expect(page).to have_css('p', text: "Funcionamento: de #{json_response[2][:working_days]}, das #{json_response[2][:open_hour]} às #{json_response[2][:close_hour]}")
    expect(page).to have_css('p', text: "#{json_response[2][:address]}")
  end

end
