class RemoveTypeFromAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :type, :integer
  end
end
