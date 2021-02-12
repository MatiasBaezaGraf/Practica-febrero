class CreateDrugs < ActiveRecord::Migration[6.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :lab
      t.string :country

      t.timestamps
    end
  end
end
