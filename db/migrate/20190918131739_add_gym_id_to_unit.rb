class AddGymIdToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :gym_id, :integer
  end
end
