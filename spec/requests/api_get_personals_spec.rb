require 'rails_helper'

describe 'Api get personals' do
  it 'successfully' do
    create(:personal, email: 'personal1@mail.com')
    create(:profile, first_name: 'Personal1', last_name: 'da Silva')
    create(:personal, email: 'personal2@mail.com')
    create(:profile, first_name: 'Personal2', last_name: 'da Costa')
    create(:personal, email: 'personal3@mail.com')
    create(:profile, first_name: 'Personal3', last_name: 'de Souza')
    #act
    get api_v1_personals_path
    json_personals = JSON.parse(response.body, symbolize_names: true)
    #assert
    expect(response.status).to eq 200
    expect(json_personals.size).to eq 3
    expect(json_personals[0][:email]).to eq 'personal1@mail.com'
    expect(json_personals[0][:profile][:first_name]).to eq 'Personal1'
    expect(json_personals[0][:profile][:last_name]).to eq 'da Silva'
    expect(json_personals[1][:email]).to eq 'personal2@mail.com'
    expect(json_personals[1][:profile][:first_name]).to eq 'Personal2'
    expect(json_personals[1][:profile][:last_name]).to eq 'da Costa'
    expect(json_personals[2][:email]).to eq 'personal3@mail.com'
    expect(json_personals[2][:profile][:first_name]).to eq 'Personal3'
    expect(json_personals[2][:profile][:last_name]).to eq 'de Souza'
  end
end