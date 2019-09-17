class AddRefAccountToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :account, foreign_key: true
  end
end
