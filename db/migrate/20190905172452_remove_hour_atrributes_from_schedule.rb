class RemoveHourAtrributesFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :start, :string
    remove_column :schedules, :finish, :string
  end
end
