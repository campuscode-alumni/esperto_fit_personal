class AddWorkDocumentToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :work_document, :string
  end
end
