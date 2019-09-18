class PlansController < ApplicationController

  def new
    @profile = current_account.profile
    @plans = Plan.gym_plans(current_account.unit.ex_gym_ref)
  end

end
