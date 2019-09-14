class HomeController < ApplicationController
  def index
    if account_signed_in?
      return redirect_to new_profile_path unless current_account.profile?     
    end
    @units = Unit.all
    if @units.empty? 
      flash[:alert] = 'Nenhuma unidade cadastrada'
    end
  end
end
