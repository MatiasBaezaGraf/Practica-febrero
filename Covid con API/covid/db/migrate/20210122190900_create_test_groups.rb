class CreateTestGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :test_groups do |t|
      t.string :name
      t.integer :max_applicants

      t.timestamps
    end
  end
end
