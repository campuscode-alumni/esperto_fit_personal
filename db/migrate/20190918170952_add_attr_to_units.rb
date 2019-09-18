class AddAttrToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :cod, :integer
    add_column :units, :open_hour, :string
    add_column :units, :close_hour, :string
    add_column :units, :working_days, :string
    add_column :units, :address, :string
  end
end
