require 'rails_helper'

feature 'Personal creates schedule' do
  before(:each) do
    cpf_status_empty
  end
  scenario 'and they should be logged in' do
    account = create(:personal, email: 'teste@email.com', password: '123456', document:'12345678908')
    profile = create(:profile, account: account)

    login_as(account, scope: :account)

    visit root_path

    expect(page).to have_content('Cadastrar agenda')
  end

  scenario 'successfully creates schedule' do
    personal = create(:personal, email: 'teste@email.com', password: '123456', document:'12345678908')
    unit = create(:unit, name: 'Matriz')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Data', with: '2019-09-20'
    fill_in 'Horário de Início', with: '8'
    fill_in 'Horário de Término', with: '16'
    fill_in 'Valor', with: '35'
    click_on 'Salvar'

    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_css('td', text: '2019-09-20')
    expect(page).to have_css('td', text: '8h')
  end

  scenario 'and must fill all fields' do
    personal = create(:personal, email: 'teste@email.com', password: '123456', document:'12345678908')
    unit = create(:unit, name: 'Matriz')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: ''
    fill_in 'Data', with: ''
    fill_in 'Horário de Início', with: ''
    fill_in 'Horário de Término', with: ''
    fill_in 'Valor', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Erro ao cadastrar agenda')
  end

  scenario 'and the price cant be negative' do
    personal = create(:personal, email: 'teste@email.com', password: '123456', document:'12345678908')
    unit = create(:unit, name: 'Matriz')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: 'Unidade'
    fill_in 'Data', with: 'Segunda-feira'
    fill_in 'Horário de Início', with: '8'
    fill_in 'Horário de Término', with: '16'
    fill_in 'Valor', with: '-2'
    click_on 'Salvar'

    expect(page).to have_content('Erro ao cadastrar agenda')

  end

  scenario 'and a not loged in personal cant create schedule' do
    visit root_path

    expect(page).not_to have_content('Cadastrar agenda')

  end
end
