class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :account, foreign_key: true
      t.integer :start_hour
      t.integer :end_hour
      t.date :date_appointment

      t.timestamps
    end
  end
end
