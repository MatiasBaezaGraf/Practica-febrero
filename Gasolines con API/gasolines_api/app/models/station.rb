class Station < ActiveRecord::Base
	has_many :discharges
end
