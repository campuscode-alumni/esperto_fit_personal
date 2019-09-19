class ProfilesController < ApplicationController

  before_action :set_id, only: %i[edit update]
  before_action :authenticate_account!, only: %i[new create edit update]

  def index

  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.account_id = current_account.id

    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    redirect_to root_path if !@profile.owner? current_account
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Editado com sucesso!'
      redirect_to @profile
    else
      flash.now[:alert] = 'Cadastro não editado.'
      render :edit
    end
  end

  def payments
    @payments = Payments.find(Profile.find(params[:id]).account.document)
  end
  private

  def profile_params
    params.require(:profile).permit(:document, :first_name, :last_name, :date_of_birth,
                                    :gender, :address, :contact, :nickname,
                                    :payment_method, :work_document)
  end

  def set_id
    @profile = Profile.find(params[:id])
  end
end
