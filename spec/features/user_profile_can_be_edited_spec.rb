require 'rails_helper'

feature 'User profile can be edited' do
  scenario '1: access  account profile details' do
    #Arrange
    profile = create(:profile, :personal)
    
    #Act
    login_as profile.account, scope: :account
    visit root_path

    click_on profile.account.name

    #Assert
    expect(page).to have_css('h3', text: "Conta de #{profile.account.name}")
    expect(page).to have_link('Editar Cadastro')
    expect(page).to have_text(profile.last_name)
  end

  scenario '2: edit account profile' do
    #Arrange
    profile = create(:profile, :personal)
    
    #Act
    login_as profile.account, scope: :account
    visit root_path

    click_on profile.account.name
    click_on 'Editar Cadastro'

    fill_in 'Nome', with: 'Mauricio'
    fill_in 'Sobrenome', with: 'Oliveira'
    fill_in 'Documento', with: '54654654'
    click_on 'Editar'

    #Assert
    expect(page).to have_text('Editado com sucesso!')
    expect(page).to have_link('Voltar')
  end

  scenario '3: edit account profile must not have blank fields' do
    #Arrange
    profile = create(:profile, :personal)
    
    #Act
    login_as profile.account, scope: :account
    visit root_path

    click_on profile.account.name
    click_on 'Editar Cadastro'
    fill_in 'Nome', with: ''
    fill_in 'Sobrenome', with: ''
    fill_in 'Documento', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Data de Nascimento', with: ''
    fill_in 'Contato', with: ''
    fill_in 'Sexo', with: ''
    fill_in 'Apelido', with: ''
    fill_in 'Método de pagamento', with: ''
    click_on 'Editar'

    #Assert
    expect(page).to have_content('Cadastro não editado.')
    expect(page).to have_content('Nome Campo Obrigatório')
  end

  scenario '4: cannot access edit path if user not signed in' do
    #Arrange

    #Act
    visit edit_profile_path(create(:profile))

    #Assert
    expect(current_path).to eq new_account_session_path
  end

  scenario '5: cannot access profile edit path if the profile dont belongs to user signed in' do
    #Arrange
    profile = create(:profile)
    another_profile = create(:profile, first_name: 'Laura')
    
    #Act
    login_as profile.account, scope: :account
    visit edit_profile_path(another_profile)

    #Assert
    expect(current_path).to eq root_path
  end
end