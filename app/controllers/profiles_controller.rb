class ProfilesController < ApplicationController
  def index 
    
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.account_id = current_account.id
    
    if @profile.save
      redirect_to @profile
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:document, :first_name, :last_name, :date_of_birth,
                                    :gender, :address, :contact, :nickname,
                                    :payment_method, :work_document)
  end
end