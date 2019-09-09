class AddPersonalRefToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :account, foreign_key: true
  end
end
