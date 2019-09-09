class CustomersController < ApplicationController
  def add_unit
    customer = Customer.find(current_account.id)
    customer.update(unit: Unit.find(params[:id]) )
    flash[:notice] = 'Matricula realizada com sucesso'
    redirect_to unit_path(params[:id])
  end
end