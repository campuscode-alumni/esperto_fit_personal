class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params_schedule)
    if @schedule.save
      flash[:notice] = "Cadastrado com sucesso"
      redirect_to @schedule
    else
      flash.now[:notice] = "Erro ao cadastrar agenda"
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def params_schedule
    params.require(:schedule).permit(:date, :start, :finish, :price, :unit_id)
  end
end