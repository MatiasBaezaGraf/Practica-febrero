class Vehicle < ApplicationRecord
	has_many :services

	validates :patent, :brand, :model, :engine_code, presence: true
end
