class CreateCustomerAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_appointments do |t|
      t.references :account, foreign_key: true
      t.references :appointment, foreign_key: true
      t.string :name_class

      t.timestamps
    end
  end
end
