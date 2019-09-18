class Gym
  attr_reader :id, :cod, :name, :open_hour, :close_hour,
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
    return response.body.map { |gym| new(gym) } if response.status == 200

    []
  rescue Faraday::ConnectionFailed
    []
  end

  def self.find(id)
    response = EspertoAcademy.client.get do |req|
      req.url "gyms/#{id}"
    end
    return response.body if response.status == 200

    []
  rescue Faraday::ConnectionFailed
    []
  end

  def imgs
    return ['logo_Compact_White.jpg'] unless self.images
    self.images
  end
end
