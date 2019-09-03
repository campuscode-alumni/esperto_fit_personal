class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :document
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :gender
      t.text :address
      t.string :contact
      t.string :nickname
      t.string :payment_method

      t.timestamps
    end
  end
end
