class AddBrandIdToPlane < ActiveRecord::Migration[6.1]
  def change
    add_reference :planes, :brand, null: false, foreign_key: true
  end
end
