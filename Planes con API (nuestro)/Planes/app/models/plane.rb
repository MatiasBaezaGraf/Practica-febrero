class Plane < ActiveResource::Base
	self.site = "http://localhost:3001/"

	belongs_to :airway
	belongs_to :brand

	def self.airways
		airways = []
		for a in Airway.all
            count = 0
            for i in Plane.all
                if a == i.airway
                    count = count + 1
                end
            end
            if count < a.max_planes
                airways.push(a)
            end
        end

        airways
	end
end
