class Api::V1::CustomersController < Api::V1::ApiController
  def show 
    @customer = Customer.find(params[:id])

    render json: { @customer }, except: %i[name email schedule_id created_at updated_at], status: 202, include: {profile: {except: %i[created_at updated_at]}}

  rescue ActiveRecord::RecordNotFound
    render json: {message: "Não encontrado"}, status: 404
  end
end