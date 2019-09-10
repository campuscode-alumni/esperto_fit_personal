class Api::V1::CustomersController < Api::V1::ApiController
  def index 
    @customers = Customer.all

    if @customers.any?
      render json: @customers, status: 202
    else
      render json: {message: "Não encontrado"}, status: 404
    end
  end
end