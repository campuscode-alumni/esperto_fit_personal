class Api::V1::PersonalsController < Api::V1::ApiController
  def index
    if params[:unit]
      unit = Unit.find(params[:unit])
      personals = unit.personals
    else
      personals = Personal.all
    end
    render json: personals.as_json(include: :profile)
  end
end
