class Airplane < ActiveResource::Base
	self.site = "http://localhost:3001/"
	
	belongs_to :company
	has_many :flights

	def flightscount
        count = 0
        for v in Flight.all
            if v.airplane == self
                count = count + 1
            end
        end
        count
    end

    def self.m_r(m_r)
        airplanes = []

        m_r = m_r.downcase

        for a in Airplane.all
            m = a.model.downcase
            r = a.registration.downcase

            if m.include?(m_r) or r.include?(m_r)
                count = 0
                for a2 in airplanes
                    if a2 == a
                        count = count + 1
                    end
                end
                if count == 0
                    airplanes.push(a)
                end
            end
        end

        airplanes

    end
end
