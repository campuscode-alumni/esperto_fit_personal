require 'rails_helper'

feature 'Personal authenticates to create schedule' do
  before(:each) do
    list_gyms
  end
  
  scenario 'successfully' do
    account = create(:personal, email: 'teste@email.com', password: '123456')
    profile = create(:profile, account: account)

    login_as(account, scope: :account)

    visit root_path

    expect(page).to have_link('Cadastrar agenda')
    expect(page).to have_link('Sair')

  end

  scenario 'and a not loged in personal cant create schedule' do
    visit root_path

    expect(page).not_to have_link('Cadastrar Agenda')
    expect(page).to have_link('Entrar')

  end

  scenario 'and customers cant create schedule' do

    cpf_status_empty
    customer = create(:account, email: 'teste@email.com', password: '123456', document:'12345678908')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(page).not_to have_link('Cadastrar Agenda')
  end

  scenario 'and signed in user can sign out' do
    #Arrange
    cpf_status_empty
    customer = create(:account, email: 'teste@email.com', password: '123456', document:'12345678908')
    #Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Sair'
    #Assert
    expect(page).to have_link('Cadastrar na EspertoFit')
  end
end
