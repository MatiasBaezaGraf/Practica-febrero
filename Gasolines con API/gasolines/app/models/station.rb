class Station < ActiveResource::Base
    self.site = "http://localhost:3001/"

    validates :adress, :flag, :max_liters, presence: :true
	validates :max_liters, numericality: :true

    has_many :discharges
end
