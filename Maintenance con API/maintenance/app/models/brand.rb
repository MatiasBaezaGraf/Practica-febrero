class Brand < ActiveResource::Base
	self.site = "http://localhost:3001/"

	has_many :replacements
end
