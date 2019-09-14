require 'rails_helper'

describe 'Api get personals' do
  it 'filtered by unit' do
    #arrange
    unidade = create(:unit, name: 'Unidade1')
    personal1 = create(:personal, email: 'personal1@mail.com')
    create(:profile, first_name: 'Personal1', last_name: 'da Silva', account: personal1)
    personal2 = create(:personal, email: 'personal2@mail.com')
    create(:profile, first_name: 'Personal2', last_name: 'da Costa', account: personal2)
    personal3 = create(:personal, email: 'personal3@mail.com')
    create(:profile, first_name: 'Personal3', last_name: 'de Souza', account: personal3)
    create(:schedule, personal: personal1, unit: unidade)
    create(:schedule, personal: personal2, unit: unidade)
    create(:schedule, personal: personal3)

    #act
    get api_v1_personals_path(unit: unidade.id)
    json_personals = JSON.parse(response.body, symbolize_names: true)
    #assert
    expect(response.status).to eq 200
    expect(json_personals.size).to eq 2
    expect(json_personals[0][:email]).to eq 'personal1@mail.com'
    expect(json_personals[0][:profile][:first_name]).to eq 'Personal1'
    expect(json_personals[0][:profile][:last_name]).to eq 'da Silva'
    expect(json_personals[1][:email]).to eq 'personal2@mail.com'
    expect(json_personals[1][:profile][:first_name]).to eq 'Personal2'
    expect(json_personals[1][:profile][:last_name]).to eq 'da Costa'
    expect(response.body).not_to include 'personal3@mail.com'
    expect(response.body).not_to include 'Personal3'
    expect(response.body).not_to include 'de Souza'
  end

  it 'successfully' do
    #arrange
    personal1 = create(:personal, email: 'personal1@mail.com')
    create(:profile, first_name: 'Personal1', last_name: 'da Silva', account: personal1)
    personal2 = create(:personal, email: 'personal2@mail.com')
    create(:profile, first_name: 'Personal2', last_name: 'da Costa', account: personal2)
    personal3 = create(:personal, email: 'personal3@mail.com')
    create(:profile, first_name: 'Personal3', last_name: 'de Souza', account: personal3)

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

  it 'and personals are empty' do
    #act
    get api_v1_personals_path
    #assert
    expect(response.status).to eq 404
    expect(response.body).to include 'Nenhum personal encontrado'
  end

  it 'and personals are empty filtered by units' do
    #arrange
    unidade = create(:unit, name: 'Unidade1')
    #act
    get api_v1_personals_path(unit: unidade.id)
    #assert
    expect(response.status).to eq 404
    expect(response.body).to include 'Nenhum personal encontrado'
  end

  it 'and units params must be integer' do
    #arrange
    unidade = create(:unit, name: 'Unidade1')
    #act
    get api_v1_personals_path(unit: unidade.name)
    #assert
    expect(response.status).to eq 412
    expect(response.body).to include 'Parametro unidade espera id de Unidade'
  end
end
