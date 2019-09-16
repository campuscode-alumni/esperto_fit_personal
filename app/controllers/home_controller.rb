class HomeController < ApplicationController
  def index
    if account_signed_in?
      return redirect_to new_profile_path unless current_account.profile?     
    end

    @gyms = Gym.all
  end
end