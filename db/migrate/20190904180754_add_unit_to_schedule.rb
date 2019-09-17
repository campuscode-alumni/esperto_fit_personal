class AddUnitToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :unit, foreign_key: true
  end
end
