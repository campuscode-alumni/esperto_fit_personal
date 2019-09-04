class RemoveAccountTypeFromAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :account_type, :integer
  end
end
