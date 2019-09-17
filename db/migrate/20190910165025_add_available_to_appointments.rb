class AddAvailableToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :available, :boolean
  end
end
