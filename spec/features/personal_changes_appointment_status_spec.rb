require 'rails_helper'

feature 'Personal changes appointment status' do
  scenario 'and approves it successfully' do
    personal = create(:personal, email: 'personal@email.com', password: '123123')
    p_profile = create(:profile, first_name: 'Personal', account: personal)
    schedule = create(:schedule)
    customer = create(:customer, email: 'customer@email.com')
    c_profile = create(:profile, first_name: 'Customer', account: customer)
    enrollment = create(:enrollment, account: customer)
    appointment = create(:appointment, account: customer, schedule: schedule)
    customer_appointment = create(:customer_appointment, account: customer, appointment: appointment)

    login_as(personal, scope: :account)
    visit root_path
    
    click_on 'Agendamentos pendentes'
    click_on 'Aprovar'

    expect(page).to have_content('Agendamento aprovado com sucesso')
    expect(page).not_to have_css('th', text: c_profile.name )
  end
end