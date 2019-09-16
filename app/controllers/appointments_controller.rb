class AppointmentsController < ApplicationController
  before_action :authenticate_account!
  def show
    @unit = Unit.find(params[:id])
    #if !(current_account) 
      #redirect_to root_path
   # end
    if @unit.schedules.empty?
      flash[:alert] = 'Até o momento não há aulas de Personal disponível nesta unidade.' 
    end
  end

  def view
    @schedule = Schedule.find(params[:id])
    if !(@schedule.unit == current_account.unit)
      redirect_to root_path
    end
  end
end
