class AddUserToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :user, :string
  end
end
