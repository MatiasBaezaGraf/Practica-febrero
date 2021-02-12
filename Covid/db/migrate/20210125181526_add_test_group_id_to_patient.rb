class AddTestGroupIdToPatient < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :test_group, null: true, foreign_key: true
  end
end
