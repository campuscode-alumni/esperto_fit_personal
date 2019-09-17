require 'rails_helper'

describe Gym do
  it 'exists' do
    attributes = {}
    gym = Gym.new(attributes)

    expect(gym).to be_a Gym
  end

  it 'had attributes' do
    attributes = {  
      name: 'Academia 1',
      open_hour: '09:00',
      close_hour: '22:00',
      working_days: 'segunda á sexta',
      address: "Av Paulista 111",
      images: "https://example.com/image"
    }

    gym = Gym.new(attributes)
  
    expect(gym.name).to eq 'Academia 1'
    expect(gym.open_hour).to eq '09:00'
    expect(gym.close_hour).to eq '22:00'
    expect(gym.working_days).to eq 'segunda á sexta'
    expect(gym.address).to eq 'Av Paulista 111'
    expect(gym.images).to eq 'https://example.com/image'
  end
end