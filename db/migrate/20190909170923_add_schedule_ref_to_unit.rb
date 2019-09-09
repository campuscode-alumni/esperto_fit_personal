class AddScheduleRefToUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :units, :schedule, foreign_key: true
  end
end
