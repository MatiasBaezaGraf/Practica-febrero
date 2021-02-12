class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :patent
      t.string :brand
      t.string :model
      t.string :fuel_fype
      t.string :engine_code

      t.timestamps
    end
  end
end
