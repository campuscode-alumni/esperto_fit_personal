class AddDocumentToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :document, :string
  end
end
 
