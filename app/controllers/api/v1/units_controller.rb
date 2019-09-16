class Api::V1::UnitsController < Api::V1::ApiController
  def personals
    unit = Unit.find(params[:id])
    personals = unit.personals
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