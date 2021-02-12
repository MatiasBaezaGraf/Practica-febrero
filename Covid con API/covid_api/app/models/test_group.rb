class TestGroup < ActiveRecord::Base
	belongs_to :drug
	has_many :patients
end
