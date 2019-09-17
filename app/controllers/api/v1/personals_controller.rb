class Api::V1::PersonalsController < Api::V1::ApiController
  def index
    personals = Personal.all
    return render json: personals.as_json(include: {
      profile: {
        only: [:first_name, :last_name]
        }
      }, only: :email), status: :ok unless personals.empty?

    render json: {msg: 'Nenhum personal encontrado' }, status: :not_found
  end
end
