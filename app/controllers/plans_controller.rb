class PlansController < ApplicationController

  def new
    @plans = Plan.gym_plans(current_account.unit.ex_gym_ref)
    @plan = Plan.new
  end
  def create
    @profile = current_account.profile
    @profile.plan = params[:profile][:plan].to_i
    redirect_to root_path, notice: 'Matriculado com sucesso' if @profile.save
  end
end
