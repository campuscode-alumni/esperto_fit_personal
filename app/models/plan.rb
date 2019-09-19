class Plan
  attr_reader :id, :name, :price, :minimum_permanence

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.gym_plans(gym_id)
    response = EspertoAcademy.client.get do |req|
      req.url "gyms/#{gym_id}/plans"
    end
    return response.body[:plans].map { |plan| new(plan) } if response.status == 200

    []
  end


end
