require 'rails_helper'

feature 'Personal authenticates to create schedule' do
  scenario 'successfully' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Cadastrar agenda')
  end

  scenario 'and a not loged in personal cant create schedule' do
    visit root_path

    expect(page).not_to have_content('Cadastrar agenda')
  end

  scenario 'and customers cant create schedule' do
    customer = create(:account, email: 'teste@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).not_to have_content('Cadastrar agenda')
  end
end