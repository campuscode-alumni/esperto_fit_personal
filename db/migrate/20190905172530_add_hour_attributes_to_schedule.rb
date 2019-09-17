class AddHourAttributesToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :start, :integer
    add_column :schedules, :finish, :integer
  end
end
