class Api::V1::PersonalsController < Api::V1::ApiController
  def index
    if params[:unit]
      unit = Unit.find(params[:unit])
      personals = unit.personals
    else
      personals = Personal.all
    end
    return render json: personals.as_json(include: :profile), status: :ok unless personals.empty?

    render json: {msg: 'Nenhum personal encontrado' }, status: :not_found
  end
end
