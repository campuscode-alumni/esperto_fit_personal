require 'rails_helper'

feature 'User register account' do 
  scenario 'successfully as customer' do

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
    expect(current_path).to eq new_profile_path
    expect(Account.last.type).to eq 'Customer' 
    expect(Customer.last).to be_truthy
  end

  scenario 'Successfully as personal' do
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: 'Nome Genérico'
    fill_in 'Email', with: 'email@generico.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar Senha', with: '123456'
    select 'Personal', from: 'Tipo de Conta'
    click_on 'Enviar'
    
    #arrange
    expect(current_path).to eq new_profile_path
    expect(Account.last.type).to eq 'Personal' 
    expect(Personal.last).to be_truthy
  end

  scenario 'and must fill name field' do
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: ''
    fill_in 'Email', with: 'email@generico.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar Senha', with: '123456'
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'
    #arrange
    expect(page).to have_content("Nome não pode ficar em branco")
  end
  scenario 'and must fill email field' do
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: 'Nome Generico'
    fill_in 'Email', with: ''
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar Senha', with: '123456'
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'
    #arrange
    expect(page).to have_content("Email não pode ficar em branco")
  end
  scenario 'and must fill password field' do
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: 'Nome Generico'
    fill_in 'Email', with: 'email@generico.com'
    fill_in 'Senha', with: ''
    fill_in 'Confirmar Senha', with: ''
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'
    #arrange
    expect(page).to have_content("Senha não pode ficar em branco")
  end

  scenario 'and email must be unique' do
    user = create(:account, email: 'meu@email.com')
    #act
    visit root_path
    click_on 'Novo Usuario'
    fill_in 'Nome Completo', with: 'Nome Generico'
    fill_in 'Email', with: 'meu@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar Senha', with: '123456'
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'
    #arrange
    expect(page).to have_content("Email já está em uso")
  end
end