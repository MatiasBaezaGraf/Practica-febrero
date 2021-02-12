class Truck < ActiveResource::Base
    self.site = "http://localhost:3001/"

    validates :patent, :description, :max_liters, presence: :true
	validates :max_liters, numericality: :true

    has_many :loads

    def liters_load
		l = 0
		loads.each do | load |
			l = load.liters - load.discharges_liters
		end
		l
	end
end
