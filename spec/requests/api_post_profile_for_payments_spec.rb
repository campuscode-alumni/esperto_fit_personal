require 'rails_helper'

describe 'Post profile to payments system' do

  it 'as a customer' do 
    customer = create(:customer)
    profile1 = create(:profile, account: customer)

    post api_v1_customer_path(customer)


    expect(response.status).to eq 202
    expect(response.body).to include 'Cadastro efetuado com sucesso'
  end
end