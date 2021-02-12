class Item < ApplicationRecord
	belongs_to :service
	
	validates :description, :import, presence: true
	validates :import, numericality: true

	def self.filter(vehicle_id)
        Item.joins(service: :vehicle).where(vehicles: {id: vehicle_id})
  	end

  	def self.item_employee(employee)
        a = Array.new

        if employee == ""
            a = Item.all
        else
            for i in Item.all
                if i.service.employee == employee
                    a.push(i)
                end
            end
        end
        a
  	end
end
