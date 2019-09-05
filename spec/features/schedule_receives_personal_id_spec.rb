require 'rails_helper'

feature 'Schedule receives personal ID' do
  scenario 'successfully' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    unit = create(:unit, name: 'Matriz')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Dia da semana', with: '20022020'
    fill_in 'Horário de início', with: '8'
    fill_in 'Horário de término', with: '16'
    fill_in 'Valor', with: '35'
    click_on 'Salvar'
    click_on 'Minhas agendas'

    expect(page).to have_css('h1', text: 'Agendas')
    expect(page).to have_css('h2', text: 'Matriz')
    expect(page).to have_css('li', text: '2020-02-20')
    expect(page).to have_css('li', text: 'Horário de início: 8h')
  end
end