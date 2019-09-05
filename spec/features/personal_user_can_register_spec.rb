require 'rails_helper'

feature 'Personal can register into system' do
  scenario 'first: basic register' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar na EspertoFit'
    fill_in 'Nome Completo', with: 'Joao Rafael'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123123'
    fill_in 'Confirmar Senha', with: '123123'
    select 'Personal', from: 'Tipo de Conta'
    click_on 'Enviar'

    #Assert
    expect(current_path).to eq new_profile_path
  end

  scenario 'second: register as personal' do
    #Arrange

    #Act
    visit root_path

    click_on 'Cadastrar na EspertoFit'
    fill_in 'Nome Completo', with: 'Joao Rafael'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123123'
    fill_in 'Confirmar Senha', with: '123123'
    select 'Personal', from: 'Tipo de Conta'
    click_on 'Enviar'

    fill_in 'Nome', with: 'Joao'
    fill_in 'Sobrenome', with: 'Rafael'
    fill_in 'Documento', with: '365900187'
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Data de Nascimento', with: '25/05/1996'
    fill_in 'Contato', with: '989551359'
    fill_in 'Sexo', with: 0
    fill_in 'Apelido', with: 'jrafaeel'
    fill_in 'Metodo de pagamento', with: 'cartao de creito'
    fill_in 'Documento de trabalho', with: '654987'
    click_on 'Enviar'

    #Assert
    expect(Profile.last.first_name).to eq 'Joao'
  end
end