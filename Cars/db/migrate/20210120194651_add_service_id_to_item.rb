class AddServiceIdToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :service, null: false, foreign_key: true
  end
end
