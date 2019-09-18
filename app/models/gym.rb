class Gym
  attr_reader :id, :name, :open_hour, :close_hour,
              :working_days, :address, :images

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.all
    resp = EspertoAcademy.client.get do |req|
      req.url 'gyms'
    end
    return resp.body.map { |gym| new(gym) } if resp.status == 200
    []
  end

  def self.find(id)
    resp = EspertoAcademy.client.get do |req|
      req.url "gyms/#{id}"
    end
    return resp.body[:gym] if resp.status == 200
    []
  end
end
