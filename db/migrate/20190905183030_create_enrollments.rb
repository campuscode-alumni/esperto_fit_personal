class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|

      t.timestamps
    end
  end
end
