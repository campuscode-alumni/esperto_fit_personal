class PersonalsController < ApplicationController
  def index
    unit = Unit.find(current_account.unit.id)
    @personals = unit.personals
  end
end
