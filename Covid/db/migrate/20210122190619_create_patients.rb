class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.datetime :birth_date
      t.integer :province
      t.string :city
      t.integer :status

      t.references :infectant, foreign_key: { to_table: :patients }

      t.timestamps
    end
  end
end
