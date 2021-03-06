require 'rails_helper'

describe 'API gets customer profile' do
  it 'successfully' do
    customer = create(:customer, document: '12345678900')
    profile1 = create(:profile, account: customer)

    get api_v1_search_customer_path(document: '12345678900')
    json_customer = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 202
    expect(response.body).not_to include customer.email
    expect(json_customer[:first_name]).to include profile1.first_name
    expect(json_customer[:last_name]).to include profile1.last_name
  end

  it 'and the account ID is not valid' do
    get api_v1_search_customer_path(id: 1987)
    json_customer = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_customer[:msg]).to eq 'Não encontrado'
  end
end
