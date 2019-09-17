class AddAccountTypeToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :account_type, :integer
  end
end
