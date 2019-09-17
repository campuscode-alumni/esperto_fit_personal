class Api::V1::AccountsController < Api::V1::ApiController
  def search
    account = Account.find_by!(document: params[:document])

    render json: account.as_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: {msg: 'Conta não encontrada'}, status: :not_found
  end
end
