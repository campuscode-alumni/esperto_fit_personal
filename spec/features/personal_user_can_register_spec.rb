require 'rails_helper'

feature 'Personal can register into system' do
  before(:each) do
    list_gyms
  end
  scenario 'first: basic register' do
    #Arrange
    cpf_status_empty
    #Act
    visit root_path
    click_on 'Cadastrar na EspertoFit'
    fill_in 'CPF', with: '12345678908'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123123'
    fill_in 'Confirmar Senha', with: '123123'
    select 'Personal', from: 'Tipo de Conta'
    click_on 'Enviar'

    #Assert
    expect(current_path).to eq new_profile_path
  end

  scenario 'second: not see link to basic register when logged in' do
    #Arrange
    personal = create(:personal)

    #Act
    login_as personal, scope: :account
    visit root_path

    #Assert
    expect(page).to_not have_link('Cadastrar na EspertoFit')
  end

  scenario 'third: register as personal profile' do
    #Arrange
    personal = create(:personal)

    #Act
    login_as personal, scope: :account
    visit root_path

    fill_in 'Nome', with: 'Joao'
    fill_in 'Sobrenome', with: 'Rafael'
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Data de Nascimento', with: '25/05/1996'
    fill_in 'Contato', with: '989551359'
    fill_in 'Sexo', with: 'male'
    fill_in 'Apelido', with: 'jrafaeel'
    fill_in 'Método de Recebimento', with: 'credito em conta'
    fill_in 'Documento de Trabalho', with: '654987'
    click_on 'Enviar'

    #Assert
    expect(Profile.last.first_name).to eq 'Joao'
  end
end
