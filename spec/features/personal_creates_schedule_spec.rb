require 'rails_helper'

feature 'Personal creates schedule' do
  scenario 'and they should be logged in' do
    personal = create(:personal)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Cadastrar agenda')
  end

  scenario 'successfully' do
    personal = create(:personal)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'
    check('Segunda-feira')
    check('Quarta-feira')
    fill_in 'Inicio', with: '8'
    fill_in 'Termino', with: '16'
    fill_in 'Valor', with: '35'
    click_on 'Salvar'

    expect(page).to have_content('Cadastrado com sucesso')

  end
end