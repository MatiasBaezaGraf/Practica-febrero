class AddAirplaneIdToFlight < ActiveRecord::Migration[6.1]
  def change
    add_reference :flights, :airplane, null: false, foreign_key: true
  end
end
