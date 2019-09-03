class RemoveNameFromAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :name, :string
  end
end
