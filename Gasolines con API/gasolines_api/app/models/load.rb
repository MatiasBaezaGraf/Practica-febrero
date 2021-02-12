class Load < ActiveRecord::Base
	has_many :discharges
    belongs_to :truck
end
