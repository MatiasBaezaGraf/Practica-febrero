class CreatePlanes < ActiveRecord::Migration[6.1]
  def change
    create_table :planes do |t|
      t.string :model
      t.string :patent

      t.timestamps
    end
  end
end
