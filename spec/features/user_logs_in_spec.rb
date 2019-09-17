require 'rails_helper'

feature 'User Logs In' do

  scenario 'Successfully' do
    cpf_status_empty
    user = create(:account, password:'123456', document: '12345678908')
    create(:profile, account: user)
    #act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Olá, #{user.profile.nickname}"
  end

  scenario 'and must exist' do
    #Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'abc@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    #Assert
    expect(current_path).to eq new_account_session_path
    expect(page).to have_content "Email ou senha inválida"
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end

  scenario 'and must not be banished' do
    cpf_status
    user = create(:account, password:'123456', document: '99999999999')
    create(:profile, account: user)
    #act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    #Assert
    expect(current_path).to eq new_account_registration_path
    expect(page).to have_content "CPF banido"
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end

end
