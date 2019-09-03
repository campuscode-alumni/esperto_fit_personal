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
    #fill_in 'Repetir Senha', with: '123456'
    #choose('Aluno')
    click_on 'Enviar'
    #arrange
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq root_path
  
  end
end