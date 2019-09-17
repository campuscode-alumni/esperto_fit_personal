class Gym
  attr_reader :name, :open_hour, :close_hour,
              :working_days, :address, :images

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.all
    response = EspertoAcademy.client.get do |req|
      req.url 'gyms'
    end
    #byebug
    if response.status == 200 
      return response.body
    end
  end
end
