class RemoveAccountRefFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_reference :customers, :account, foreign_key: true
  end
end
