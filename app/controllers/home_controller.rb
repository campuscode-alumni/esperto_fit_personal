class HomeController < ApplicationController
  def index
    if account_signed_in?
      return redirect_to new_profile_path unless current_account.profile?
    end
    units = Faraday.get 'http://localhost:4000/api/v1/gyms'
    gyms = JSON.parse(units.body, symbolize_names: true)
    status = units.status
    @result = [gyms, status: status]
    
  end
end
