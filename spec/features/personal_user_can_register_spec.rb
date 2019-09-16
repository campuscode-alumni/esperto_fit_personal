require 'rails_helper'

feature 'Personal can register into system' do
  before(:each) do
    filename = 'gyms.json'
    url      = 'http://0.0.0.0:3000/api/v1/gyms'
    stub_get_json(url, filename)
  end
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
    fill_in 'Documento', with: '365900187'
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Data de Nascimento', with: '25/05/1996'
    fill_in 'Contato', with: '989551359'
    fill_in 'Sexo', with: 'male'
    fill_in 'Apelido', with: 'jrafaeel'
    fill_in 'Metodo de recebimento', with: 'credito em conta'
    fill_in 'Documento de trabalho', with: '654987'
    click_on 'Enviar'

    #Assert
    expect(Profile.last.first_name).to eq 'Joao'
  end
end