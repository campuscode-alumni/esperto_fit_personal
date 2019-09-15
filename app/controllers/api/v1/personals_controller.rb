class Api::V1::PersonalsController < Api::V1::ApiController
  def index

    if params[:unit_id]
      unit = Unit.find(params[:unit_id])
      personals = unit.personals
    else
      personals = Personal.all
    end

    return render json: personals.as_json(include: {
      profile: {
        only: [:first_name, :last_name]
        }
      }, only: :email), status: :ok unless personals.empty?

    render json: {msg: 'Nenhum personal encontrado' }, status: :not_found

    rescue ActiveRecord::RecordNotFound

    render json: {msg: 'Parametro unidade espera id de Unidade' }, status: 412
  end
end
