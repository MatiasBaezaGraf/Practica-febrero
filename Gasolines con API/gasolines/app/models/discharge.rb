class Discharge < ActiveResource::Base
    self.site = "http://localhost:3001/"

    validates :liters, :date, :presence => true
	validates :liters, :numericality => true

    belongs_to :load
    belongs_to :station
end
