class AddAttributesToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :document, :string
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :date_of_birth, :date
    add_column :accounts, :gender, :string
    add_column :accounts, :address, :text
    add_column :accounts, :contact, :string
    add_column :accounts, :password, :string
    add_column :accounts, :payment, :string
  end
end
