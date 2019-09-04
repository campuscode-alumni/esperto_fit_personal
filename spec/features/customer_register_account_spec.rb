require 'rails_helper'

feature 'User register account' do 
  scenario 'Successfully' do
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: 'Nome Genérico'
    fill_in 'Email', with: 'email@generico.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar Senha', with: '123456'
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'
    #arrange
    account = Account.last
    byebug
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq root_path
    expect(page).to have_css('h2', text: 'Olá Nome Genérico')
    expect(account.type).to eq 'Customer' 
  end
end