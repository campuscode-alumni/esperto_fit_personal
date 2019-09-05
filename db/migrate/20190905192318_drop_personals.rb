class DropPersonals < ActiveRecord::Migration[5.2]
  def change
    drop_table :personals
  end
end
