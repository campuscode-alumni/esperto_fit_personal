class AddExGymRefToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :ex_gym_ref, :integer
  end
end
