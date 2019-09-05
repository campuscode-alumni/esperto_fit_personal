class RemoveWorkDocFromPersonals < ActiveRecord::Migration[5.2]
  def change
    remove_column :personals, :work_document, :string
  end
end
