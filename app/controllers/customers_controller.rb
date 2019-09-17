class CustomersController < ApplicationController
  before_action :authenticate_account!, only: %i[ add_unit ]

  def add_unit
    if current_account.type == "Customer"
      byebug
      customer = Customer.find(current_account.id) 
      unit = JSON.parse((Faraday.get 'http://localhost:4000/api/v1/gyms').body, symbolize_names: true)
      
      customer.update(unit: unit)
      flash[:notice] = 'Matricula realizada com sucesso'
      redirect_to unit_path(params[:id])
    else
      redirect_to root_path
    end
  end
end
