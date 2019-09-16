require 'rails_helper'

feature 'visitor view units' do
  before(:each) do
    filename = 'gyms.json'
    url      = 'http://0.0.0.0:3000/api/v1/gyms'
    stub_get_json(url, filename)
  end

  scenario 'sucessfully' do
    visit root_path

    json_response = JSON.parse(
      File.read(Rails.root.join('spec', 'support', "gyms.json")
    ), symbolize_names: true)

    expect(page).to have_css('.gym', count: 3)

    expect(page).to have_css('h3', text: 'Academia 01')
    expect(page).to have_css("img[src*='#{json_response[0][:images][0]}']")
    expect(page).to have_css('li', text: "Horário de atendimento das #{json_response[0][:open_hour]} às #{json_response[0][:close_hour]} de #{json_response[0][:working_days]}")
    expect(page).to have_css('li', text: "#{json_response[0][:address]}")

    expect(page).to have_css('h3', text: 'Academia 02')
    expect(page).to have_css("img[src*='#{json_response[1][:images][0]}']")
    expect(page).to have_css('li', text: "Horário de atendimento das #{json_response[1][:open_hour]} às #{json_response[1][:close_hour]} de #{json_response[1][:working_days]}")
    expect(page).to have_css('li', text: "#{json_response[1][:address]}")

    expect(page).to have_css('h3', text: 'Academia 03')
    expect(page).to have_css("img[src*='#{json_response[2][:images][0]}']")
    expect(page).to have_css('li', text: "Horário de atendimento das #{json_response[2][:open_hour]} às #{json_response[2][:close_hour]} de #{json_response[2][:working_days]}")
    expect(page).to have_css('li', text: "#{json_response[2][:address]}")
  end

end
