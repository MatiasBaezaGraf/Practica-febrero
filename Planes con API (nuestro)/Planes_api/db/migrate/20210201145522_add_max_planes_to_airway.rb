class AddMaxPlanesToAirway < ActiveRecord::Migration[6.1]
  def change
    add_column :airways, :max_planes, :integer
  end
end
