class Replacement < ActiveResource::Base
	self.site = "http://localhost:3001/"

	belongs_to :brand
	has_many :invoice_items
end
