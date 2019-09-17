class UnitsController < ApplicationController
  def index
    @units = Gym.all
  end
  
  def show
    @unit = Gym.find(params[:id])
  end
end
