class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :start
      t.string :finish
      t.string :price

      t.timestamps
    end
  end
end
