json.extract! invoice, :id, :bill_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
