require 'rails_helper'

feature 'Customer can register into system' do
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
    select 'Aluno', from: 'Tipo de Conta'
    click_on 'Enviar'

    #Assert
    expect(current_path).to eq new_profile_path
  end

  scenario 'second: register as customer' do
    #Arrange
    customer = create(:customer)
    
    #Act
    login_as customer, scope: :account
    visit root_path

    fill_in 'Nome', with: 'Mauricio'
    fill_in 'Sobrenome', with: 'Oliveira'
    fill_in 'Documento', with: '365900187'
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Data de Nascimento', with: '25/05/1996'
    fill_in 'Contato', with: '989551359'
    fill_in 'Sexo', with: 'male'
    fill_in 'Apelido', with: 'jrafaeel'
    fill_in 'Metodo de pagamento', with: 'cartao de credito'
    click_on 'Enviar'

    #Assert
    expect(Profile.last.first_name).to eq 'Mauricio'
    expect(Profile.last.work_document).to be_falsey
  end
end