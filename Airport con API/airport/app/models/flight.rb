class Flight < ActiveResource::Base
	self.site = "http://localhost:3001/"
	
	belongs_to :airplane

	def statusF
         status = ""

         case self.state_code
         when 1
             status = "Late"
         when 2
             status = "Landed"
         when 3
             status = "On Time"
         end

         status

    end

    def self.filterdate(date)

        date = date.to_date
        a = Array.new
        if date.blank?
            a = Flight.all
        else
            for v in Flight.all
                condition = 0
                if (v.departure_date.to_date == date or v.arrival_date.to_date == date)
                    a.push(v)
                elsif (v.departure_date.to_date < date and v.arrival_date.to_date > date)
                    a.push(v)
                end 
            end
        end
        a
    end

    def self.filtercompany(company_id)
        a = []
        for v in Flight.all
            if v.airplane.company_id.to_i == company_id.to_i
                a.push(v)
            end
        end
        a
    end

    def self.filterairport(airport)
        flights = []

        airport = airport.downcase

        for v in Flight.all
            ap = v.airport.downcase
            if ap.include?(airport)
                puts v.airport
                flights.push(v)
            end
        end

        flights

    end

    def self.filtername(name)
        flights = []

        name = name.downcase

        for v in Flight.all
            ap = v.name.downcase
            if ap.include?(name)
                puts v.name
                flights.push(v)
            end
        end

        flights

    end

    

end
