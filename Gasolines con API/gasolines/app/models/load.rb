class Load < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :discharges
    belongs_to :truck

    validates :liters, :date, :liter_amount, :truck_id, presence: :true
	validates :liters, numericality: :true

    validate :count_liters

    def count_liters
    	countl = 0
    	countd = 0

    	for l in Load.all
    		if l.truck == self.truck
    			countl = countl + l.liters
    			for d in Discharge.all
    				if d.load == l
    					countd = countd + d.liters
    				end
    			end
    		end
    	end

    	if self.truck.max_liters.to_i == (countl - countd)
    		errors.add(:truck, "error: Truck is full")
    	elsif(countl - countd) < self.truck.max_liters.to_i and self.liters.to_i > (self.truck.max_liters.to_i - (countl - countd))
    		errors.add(:liters, "error: Truck has not enough space")		
    	end
    end
end
