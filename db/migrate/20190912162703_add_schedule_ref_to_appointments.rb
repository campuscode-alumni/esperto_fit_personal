class AddScheduleRefToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :schedule, foreign_key: true
  end
end
