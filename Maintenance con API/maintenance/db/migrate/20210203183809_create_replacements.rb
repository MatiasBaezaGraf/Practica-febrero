class CreateReplacements < ActiveRecord::Migration[6.1]
  def change
    create_table :replacements do |t|
      t.string :name
      t.date :manufacture_date
      t.integer :serial_number

      t.timestamps
    end
  end
end
