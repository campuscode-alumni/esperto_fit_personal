require 'rails_helper'

feature 'visitor view units' do
  before(:each) do
    filename = 'gyms.json'
    url      = 'http://0.0.0.0:3000/api/v1/gyms'
    stub_get_json(url, filename)
  end

  scenario 'sucessfully' do  
    visit root_path

    #expect(page).to have_text 'Unidade'

    expect(page).to have_css('.gym', count: 3)

    expect(page).to have_css('h3', text: 'Academia 01')
    expect(page).to have_css('h3', text: 'Academia 02')
    expect(page).to have_css('h3', text: 'Academia 03')
  end
end