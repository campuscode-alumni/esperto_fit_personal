class CustomersController < ApplicationController
  before_action :authenticate_account!, only: %i[ add_unit ]

  def add_unit
    redirect_to root_path unless current_account.type == "Customer"
      customer = Customer.find(current_account.id)
      unit = Unit.find(params[:id])
      customer.update(unit: unit)
      flash[:notice] = 'Matricula realizada com sucesso'
      redirect_to root_path
  end
end
