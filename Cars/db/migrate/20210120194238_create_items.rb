class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :description
      t.float :import

      t.timestamps
    end
  end
end
