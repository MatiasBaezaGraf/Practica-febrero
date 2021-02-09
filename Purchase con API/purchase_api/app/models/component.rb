class Component < ActiveRecord::Base
	belongs_to :brand
	has_many :item_carts
end
