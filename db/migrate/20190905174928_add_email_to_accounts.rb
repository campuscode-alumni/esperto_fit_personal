class AddEmailToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :email, :string
  end
end
