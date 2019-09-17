class CustomersController < ApplicationController
  before_action :authenticate_account!, only: %i[ add_unit ]

  def add_unit
    if current_account.type == "Customer"
      customer = Customer.find(current_account.id) 
      unit = JSON.parse(Gym.find(params[:id]), symbolize_names: true)
      if customer.profile.enrollment_id == nil 
        #byebug
        customer.profile.update(enrollment_id: unit[:id])
        flash[:notice] = 'Matricula realizada com sucesso'
        redirect_to root_path
      else
        customer.profile.update(enrollment_id: unit[:id])
        flash[:notice] = 'Unidade Trocada com sucesso'
        redirect_to root_path 
      end
    else
      redirect_to root_path
    end
  end
end
