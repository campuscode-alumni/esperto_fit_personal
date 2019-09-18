module RequestStub
  def list_gyms
    filename = 'gyms.json'
    url      = 'http://0.0.0.0:4000/api/v1/gyms'
    json_response = JSON.parse(
      File.read(Rails.root.join('spec', 'support', "#{filename}")
    ), symbolize_names: true)
    stub_request(:get, url).
      to_return(status: 200, body: json_response)
  end

  def one_gym
    filename = 'gym.json'
    url      = 'http://0.0.0.0:4000/api/v1/gyms'
    json_response = JSON.parse(
      File.read(Rails.root.join('spec', 'support', "#{filename}")
    ), symbolize_names: true)
    stub_request(:get, url).
      to_return(status: 200, body: json_response)

  end
end
