class UnitsController < ApplicationController
  def index
    @units = Unit.all
  end
end