require 'rails_helper'

feature 'Personal creates schedule' do
  scenario 'and they should be logged in' do
    personal = Personal.create(email: 'personal@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'personal@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Cadastrar agenda')
  end
end