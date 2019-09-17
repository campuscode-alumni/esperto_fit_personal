class AddEnrollmentRefToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :enrollment, foreign_key: true
  end
end
