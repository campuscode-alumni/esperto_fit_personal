class AddTypeToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :type, :integer
  end
end
