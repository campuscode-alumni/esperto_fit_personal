module RequestStub
  def cpf_status
    filename = 'cpf_status.json'
    url      = 'http://0.0.0.0:3000/api/v1/clients/consult_cpf/99999999999'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url)
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.15.4'
           }
      )
      .to_return(status: 302, body: json_response, headers:  {'Content-Type': 'application/json'})
  end

  def cpf_status_empty
    filename = 'cpf_status.json'
    url      = 'http://0.0.0.0:3000/api/v1/clients/consult_cpf/12345678908'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url)
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.15.4'
           }
      )
      .to_return(status: 404, body: 'Não encontrado' , headers:  {})
  end

  def list_gyms
    filename = 'gyms.json'
    url      = 'http://academy.com.br/api/v1/gyms'
    json_response = JSON.parse(
      File.read(Rails.root.join('spec', 'support', "#{filename}")
    ), symbolize_names: true)
    stub_request(:get, url).
      to_return(status: 200, body: json_response)
  end
end
