class Service < ApplicationRecord
	belongs_to :vehicle
	has_many :items

	validates :time, :employee, presence: true

	def item_count
		x = 0
		for i in Item.all
			if i.service == self
				x = x + 1
			end
		end
		x
	end

	def item_cost
		x = 0
		for i in Item.all
			if i.service == self
				x = x + i.import
			end
		end
		x
	end
end
