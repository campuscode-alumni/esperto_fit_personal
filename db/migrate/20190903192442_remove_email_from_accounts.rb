class RemoveEmailFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :email, :string
  end
end
