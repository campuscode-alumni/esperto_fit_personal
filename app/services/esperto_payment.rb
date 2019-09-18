require 'faraday'
require 'faraday_middleware'

class EspertoPayment
  class << self
    def endpoint
      Rails.configuration.esperto_academy[:payment_url]
    end

    def api_version
      'v1'
    end

    def esperto_payment_url
      "#{endpoint}/api/#{api_version}"
    end

    def client
      @client ||= new_connection
    end

    private

    def new_connection
      Faraday.new(url: esperto_payment_url) do |faraday|
        faraday.use :instrumentation
        faraday.headers['Content-Type'] = 'application/json'

        faraday.response :json, parser_options: { symbolize_names: true },
          content_type: /\bjson$/
        faraday.adapter :net_http
      end
    end
  end
end
