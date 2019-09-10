class RemoveScheduleRefFromUnits < ActiveRecord::Migration[5.2]
  def change
    remove_reference :units, :schedule, foreign_key: true
  end
end
