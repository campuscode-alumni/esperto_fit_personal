require 'rails_helper'

feature 'Personal can register into system' do
  scenario 'first: basic register' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar na EspertoFit'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123123'
    # fill_in 'Nome', with: 'Joao'
    # fill_in 'Sobrenome', with: 'Rafael'
    # fill_in 'Documento', with: '365900187'
    # fill_in 'Endereço', with: 'Av Paulista, 374'
    # fill_in 'Contato', with: '989551359'
    # fill_in 'E-mail', with: 'j.rafaeel@hotmail.com'
    # fill_in 'Usuário/Nickname', with: 'jrafaeel'
    # fill_in 'Senha', with: '123456'
    click_on 'Enviar'

    #Assert
    expect(page).to have_css('p', text: 'Olá, email@email.com.')
  end

  scenario 'second: register as personal' do
    pending
    #Arrange

    #Act
    visit root_path
    ### logar para cadastrar como personal
    fill_in 'Nome', with: 'Joao'
    fill_in 'Sobrenome', with: 'Rafael'
    fill_in 'Documento', with: '365900187'
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Contato', with: '989551359'
    fill_in 'E-mail', with: 'j.rafaeel@hotmail.com'
    fill_in 'Usuário/Nickname', with: 'jrafaeel'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'

    #Assert
    #expect(page).to have_css('p', text: 'Olá, email@email.com.')
  end
end