class Replacement < ActiveRecord::Base
	belongs_to :brand
	has_many :invoice_items
end
