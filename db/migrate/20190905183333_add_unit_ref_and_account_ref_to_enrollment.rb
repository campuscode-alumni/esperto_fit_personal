class AddUnitRefAndAccountRefToEnrollment < ActiveRecord::Migration[5.2]
  def change
    add_reference :enrollments, :unit, foreign_key: true
    add_reference :enrollments, :account, foreign_key: true
  end
end
