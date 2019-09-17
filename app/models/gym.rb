class Gym
  attr_reader :name, :open_hour, :close_hour,
              :working_days, :address, :images

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end
  
  def self.find(id)
    response = EspertoAcademy.client.get do |req|
      req.url "gyms/#{id}"
    end
    return new(response.body) if response.status == 200
  end

  def self.all
    response = EspertoAcademy.client.get do |req|
      req.url 'gyms'
    end
    if response.status == 200 
      return response.body
    end
  end

  def self.find(id)
    response = EspertoAcademy.client.get do |req|
      req.url "gyms/#{id}"
    end
    if response.status == 200 
      return JSON.parse(response.body, symbolize_names: true)
    end 
  end
end
