class AddLoadIdToDischarge < ActiveRecord::Migration[6.0]
  def change
    add_reference :discharges, :load, null: false, foreign_key: true
  end
end
