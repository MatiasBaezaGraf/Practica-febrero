class TestGroup < ApplicationRecord
	belongs_to :drug
	has_many :patients

	def applicants
		count = 0
		for x in Patient.all
			if x.test_group == self
				count = count + 1
			end
		end
		count
	end
end
