class RemoveDocumentFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :document, :string
  end
end
 
