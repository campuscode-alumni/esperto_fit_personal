require 'rails_helper'

describe 'API gets customers' do
  it 'successfully' do
    customer1 = create(:customer, email: 'customer1@email.com')
    profile1 = create(:profile, account: customer1)    
    customer2 = create(:customer, email: 'customer2@email.com')
    profile2 = create(:profile, account: customer2)    
    customer3 = create(:customer, email: 'customer3@email.com')
    profile3 = create(:profile, account: customer3)    

    get api_v1_customers_path

    expect(response.status).to eq 202
    expect(response.body).to include customer1.name
    expect(response.body).to include customer2.name
    expect(response.body).to include customer3.name
  end

  it 'and cannot find it' do
    get api_v1_customers_path

    expect(response.status).to eq 404
    expect(response.body).to include 'Não encontrado'
  end
end