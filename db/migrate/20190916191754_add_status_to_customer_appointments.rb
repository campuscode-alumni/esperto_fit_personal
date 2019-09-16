class AddStatusToCustomerAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_appointments, :status, :integer, default: 0
  end
end
