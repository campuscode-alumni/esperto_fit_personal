class RemoveTypeFromProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :type, :string
  end
end
