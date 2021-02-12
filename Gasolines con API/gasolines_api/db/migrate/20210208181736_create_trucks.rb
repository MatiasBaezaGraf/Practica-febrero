class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :patent
      t.text :description
      t.integer :max_liters

      t.timestamps
    end
  end
end
