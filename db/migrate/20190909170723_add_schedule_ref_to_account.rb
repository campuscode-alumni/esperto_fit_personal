class AddScheduleRefToAccount < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :schedule, foreign_key: true
  end
end
