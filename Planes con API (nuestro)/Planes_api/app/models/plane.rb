class Plane < ActiveRecord::Base
	belongs_to :brand
	belongs_to :airway
end
