require 'rails_helper'

feature 'Customer can register into system' do
  before(:each) do
    list_gyms
  end
  
  scenario 'first: basic register' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar na EspertoFit'
    fill_in 'CPF', with: '12345678912'
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
    fill_in 'Endereço', with: 'Av Paulista, 374'
    fill_in 'Data de Nascimento', with: '25/05/1996'
    fill_in 'Contato', with: '989551359'
    fill_in 'Sexo', with: 'male'
    fill_in 'Apelido', with: 'jrafaeel'
    fill_in 'Método de Pagamento', with: 'cartao de credito'
    click_on 'Enviar'
    save_page
    #Assert
    expect(Profile.last.first_name).to eq 'Mauricio'
    expect(Profile.last.work_document).to be_falsey
  end
end
