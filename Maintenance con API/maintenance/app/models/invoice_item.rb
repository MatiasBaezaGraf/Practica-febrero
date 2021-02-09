class InvoiceItem < ActiveResource::Base
	self.site = "http://localhost:3001/"

	belongs_to :replacement
	belongs_to :invoice
end
