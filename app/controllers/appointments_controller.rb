class AppointmentsController < ApplicationController
  def show
    @unit = Unit.find(params[:id])
    byebug
    flash.now[:alert] = 'Até o momento não há aulas de Personal disponível nesta unidade.' if @unit.schedules.empty?
  end

  def view
    @schedule = Schedule.find(params[:id])
    if !(@schedule.unit == current_account.unit)
      redirect_to root_path
    end
  end
end
