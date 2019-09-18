class UnitsController < ApplicationController
  def show
    @unit = Gym.find(params[:id])
  end
end
