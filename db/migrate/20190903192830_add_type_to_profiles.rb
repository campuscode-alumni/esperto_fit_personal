class AddTypeToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :type, :integer
  end
end
