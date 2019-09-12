class AppointmentsController < ApplicationController
  def show
    @unit = Unit.find(params[:id])
    flash.now[:alert] = 'Até o momento não há aulas de Personal disponível nesta unidade.' unless !@unit.schedules.nil?
  end
end