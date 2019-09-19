class HomeController < ApplicationController

  def index
    if account_signed_in?
      return redirect_to new_profile_path unless current_account.profile?
      return redirect_to new_plan_path if current_account.type == 'Customer' &&
         current_account.profile.plan == nil && current_account.unit != nil
    end
    Unit.load_api
    @units = Unit.all
  end
end
