class AppointmentsController < ApplicationController
  def show
    @unit = Unit.find(params[:id])
    
 
    #byebug
    # @schedule = Schedule.where(unit_id: @unit)
    # byebug
    # @personal = Account.where(schedule_id: @schedule)
    # byebug
    # @appm = Appointment.where(account_id: @personal)
    # byebug
  end
end