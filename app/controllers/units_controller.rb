class UnitsController < ApplicationController
  def index
    @units = Gym.all
  end
  
  def show
    @unit = JSON.parse(Gym.find(params[:id]), symbolize_names: true)
  end
end
