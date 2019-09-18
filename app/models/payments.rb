class Payments
  attr_reader :cpf, :payments

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.find(cpf)
    response = EspertoPayment.client.get do |req|
      req.url "payments/#{cpf}"
    end
    return response.body if response.status == 200

    []
  end

end
