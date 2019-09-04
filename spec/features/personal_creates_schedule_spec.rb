require 'rails_helper'

feature 'Personal creates schedule' do
  scenario 'and they should be logged in' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Cadastrar agenda')
  end

  scenario 'successfully' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    unit = create(:unit)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Dia da semana', with: 'Segunda-feira'
    fill_in 'Horário de início', with: '8'
    fill_in 'Horário de término', with: '16'
    fill_in 'Valor', with: '35'
    click_on 'Salvar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_css('li', text: 'Segunda-feira')
    expect(page).to have_css('li', text: 'Horário de início: 8h')
  end

  scenario 'and must fill all field' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    unit = create(:unit)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Dia da semana', with: ''
    fill_in 'Horário de início', with: '8'
    fill_in 'Horário de término', with: ''
    fill_in 'Valor', with: '35'
    click_on 'Salvar'

    expect(page).to have_content('Erro ao cadastrar agenda')
  end

  scenario 'and the price cant be negative' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    unit = create(:unit)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Dia da semana', with: 'Segunda-feira'
    fill_in 'Horário de início', with: '8'
    fill_in 'Horário de término', with: '16'
    fill_in 'Valor', with: '-2'
    click_on 'Salvar'

    expect(page).to have_content('Erro ao cadastrar agenda')

  end
end