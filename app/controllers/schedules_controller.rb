class SchedulesController < ApplicationController
  before_action :authenticate_account!, only: %i[new create edit update my_schedule]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params_schedule)
    @schedule.personal = current_account

    if @schedule.save
      flash[:notice] = "Cadastrado com sucesso"
      @schedule.create_appointments
      redirect_to my_schedule_path
    else
      flash.now[:notice] = "Erro ao cadastrar agenda"
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def my_schedule
    redirect_to root_path unless current_account.type == "Personal"
    @schedules = Schedule.where(personal: current_account)
    if @schedules.empty?
      flash[:failure] = "Não há agendas cadastradas"
    end
  end

  private

  def params_schedule
    params.require(:schedule).permit(:date, :start, :finish, :price, :unit_id, :account_id)
  end

end
