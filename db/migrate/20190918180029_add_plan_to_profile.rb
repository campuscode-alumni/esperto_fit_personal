class AddPlanToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :plan, :integer
  end
end
