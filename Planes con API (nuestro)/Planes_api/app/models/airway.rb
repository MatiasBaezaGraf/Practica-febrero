class Airway < ActiveRecord::Base
	has_many :planes

	def self.Brands
		brands = []
		for i in Plane.all
			if i.airway == self
				brands.push(i.brand)
			end
		end
		brands
	end
end
