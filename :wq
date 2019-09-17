class HomeController < ApplicationController
  def index
    if account_signed_in?
      return redirect_to new_profile_path unless current_account.profile?
    end
    @result = [JSON.parse(Gym.all.to_json, symbolize_names: true), status: 200 ]
  end
end
