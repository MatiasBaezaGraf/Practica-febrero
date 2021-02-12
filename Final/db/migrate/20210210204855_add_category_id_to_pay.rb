class AddCategoryIdToPay < ActiveRecord::Migration[6.1]
  def change
    add_reference :pays, :category, null: false, foreign_key: true
  end
end
