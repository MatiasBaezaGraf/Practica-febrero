class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.datetime :time
      t.string :employee
      t.text :observation

      t.timestamps
    end
  end
end
