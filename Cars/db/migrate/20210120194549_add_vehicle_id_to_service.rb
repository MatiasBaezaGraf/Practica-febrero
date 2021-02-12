class AddVehicleIdToService < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :vehicle, null: false, foreign_key: true
  end
end
