class CustomersController < ApplicationController
  before_action :authenticate_account!, only: %i[ add_unit ]

  def add_unit
    if current_account.type == "Customer"
      customer = Customer.find(current_account.id) 
      #unit = JSON.parse((Faraday.get "http://localhost:4000/api/v1/gyms/#{params[:id]}").body, symbolize_names: true)
      unit = Gym.find(params[:id])
      if customer.profile.enrollment_id == nil 
        customer.profile.update(enrollment_id: unit[:gym][:id])
        flash[:notice] = 'Matricula realizada com sucesso'
        redirect_to root_path
      else
        customer.profile.update(enrollment_id: unit[:gym][:id])
        flash[:notice] = 'Unidade Trocada com sucesso'
        redirect_to root_path 
      end
    else
      redirect_to root_path
    end
  end
end
