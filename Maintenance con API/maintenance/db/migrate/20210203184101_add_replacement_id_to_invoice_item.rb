class AddReplacementIdToInvoiceItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :invoice_items, :replacement, null: false, foreign_key: true
  end
end
