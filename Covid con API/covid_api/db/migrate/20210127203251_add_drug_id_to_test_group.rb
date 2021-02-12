class AddDrugIdToTestGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_groups, :drug, null: false, foreign_key: true
  end
end
