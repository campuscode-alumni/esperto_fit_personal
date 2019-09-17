class AddAccountRefToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :account, foreign_key: true
  end
end
