class Discharge < ActiveRecord::Base
	belongs_to :load
    belongs_to :station
end
