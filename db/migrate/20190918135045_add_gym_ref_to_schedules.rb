class AddGymRefToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :gym, foreign_key: true
  end
end
