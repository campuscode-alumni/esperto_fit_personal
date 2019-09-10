require 'rails_helper'

feature 'Schedule receives account ID' do
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
    fill_in 'Dia da semana', with: '2020-02-20'
    fill_in 'Horário de início', with: '8'
    fill_in 'Horário de término', with: '16'
    fill_in 'Valor', with: '35'
    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Agendas')
    expect(page).to have_css('h2', text: 'Matriz')
    expect(page).to have_css('li', text: '2020-02-20')
    expect(page).to have_css('li', text: 'Horário de início: 8h')
    expect(page).to have_css('li', text: 'Horário de término: 16h')
    expect(page).to have_css('li', text: 'Valor/hora: R$35')
  end

  scenario 'and must fill in all fields' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    unit = create(:unit, name: 'Matriz')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar agenda'

    select 'Matriz', from: ''
    fill_in 'Dia da semana', with: ''
    fill_in 'Horário de início', with: ''
    fill_in 'Horário de término', with: ''
    fill_in 'Valor', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Erro ao cadastrar agenda')
  end

  scenario 'and must fill in all fields' do
    personal = create(:personal, email: 'teste@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Minhas agendas'

    expect(page).to have_content('Não há agendas cadastradas')
  end

  scenario 'and cannot force route' do
    visit my_schedule_path

    expect(current_path).to eq new_account_session_path
  end

  scenario 'and user should be a personal' do
    account = create(:account, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account)

    login_as(account, :scope => :account)

    visit my_schedule_path

    expect(current_path).to eq root_path
  end
end