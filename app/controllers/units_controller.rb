class UnitsController < ApplicationController
  def index
    @units = JSON.parse((Faraday.get 'http://localhost:4000/api/v1/gyms').body, symbolize_names: true)

  end

  def show
    @unit = JSON.parse((Faraday.get "http://localhost:4000/api/v1/gyms/#{params[:id]}").body, symbolize_names: true)
    @unit[:gym]
  end
end
