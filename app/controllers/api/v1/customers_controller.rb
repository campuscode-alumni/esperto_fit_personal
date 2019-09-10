class Api::V1::CustomersController < Api::V1::ApiController
  def index 
    @customers = Customer.all

    if @customers.any?
      render json: {customers: @customers}, except: %i[created_at updated_at], status: 202, include: {profile: {except: %i[created_at updated_at]}}
    else
      render json: {message: "Não encontrado"}, status: 404
    end
  end
end