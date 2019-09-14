class Api::V1::PersonalsController < Api::V1::ApiController
  def index
    unit = Unit.find(params[:unit])
    personals = unit.personals
    render json: personals.as_json(include: :profile)
  end
end
