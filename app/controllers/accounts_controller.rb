class AccountsController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
end
