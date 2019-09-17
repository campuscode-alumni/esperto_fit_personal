require 'rails_helper'
describe 'consult cpf' do
  it 'successfully' do
    #Arrange
    create(:customer, email:'email@email.com', document:'12345678900')
    create(:customer, email:'otheremail@email.com', document:'12345678901')

    #Act
    get api_v1_search_account_path(document:'12345678900')
    json_account = JSON.parse(response.body, symbolize_names: true)
    #Assert
    expect(response.status).to eq 200
    expect(json_account[:email]).to include('email@email.com')
    expect(response.body).not_to include('otheremail@email.com')

  end
  it 'and must exist' do
     #Act
     get api_v1_search_account_path(document:'83746352876')
     #Assert
     expect(response.status).to eq 404
     expect(response.body).to include('Conta não encontrada')
  end
end
