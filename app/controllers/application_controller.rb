class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:document, :type])
  end

  def after_sign_in_path_for(account)
    if account.banished?
      sign_out account
      flash.clear
      flash[:alert] = 'CPF banido'
      new_account_registration_path
    elsif account.inactive?
      sign_out account
      flash.clear
      flash[:alert] = 'CPF Inativo'
      new_account_registration_path
    else
      super
    end
  end
end
