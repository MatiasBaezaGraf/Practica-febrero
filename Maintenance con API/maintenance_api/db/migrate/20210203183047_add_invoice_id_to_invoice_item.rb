class AddInvoiceIdToInvoiceItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :invoice_items, :invoice, null: false, foreign_key: true
  end
end
