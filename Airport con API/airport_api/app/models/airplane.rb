class Airplane < ActiveRecord::Base
	belongs_to :company
	has_many :flights
end
