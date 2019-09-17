class Api::V1::CustomersController < Api::V1::ApiController

  # get api/v1/customers?id=1
  def show
    @customer = Customer.find(params[:id])

    render json: @customer.profile,
           except: %i[account_id work_document created_at updated_at],
           status: 202

  rescue ActiveRecord::RecordNotFound
    render json: { msg: "Não encontrado" }, status: 404
  end
end
