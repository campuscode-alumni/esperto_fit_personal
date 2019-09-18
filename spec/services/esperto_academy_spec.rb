require 'rails_helper'

describe EspertoAcademy do
  it 'exists' do
    esperto_academy = EspertoAcademy.new

    expect(esperto_academy).to be_a EspertoAcademy
  end
end