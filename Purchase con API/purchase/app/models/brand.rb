class Brand < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :components

    validates :name, :country, presence: true

    validate :countreia

    def countreia
        if self.country.downcase == "argentina"
        	errors.add(:country, "error: You can not select Argentina as origin country")
        end
    end

    def self.filtername(name)
        brands = []

        name = name.downcase

        for v in Brand.all
            ap = v.name.downcase
            if ap.include?(name)
                puts v.name
                brands.push(v)
            end
        end

        brands

    end

    def self.filtercountreia(country)
        brands = []

        country = country.downcase

        for v in Brand.all
            ap = v.country.downcase
            if ap.include?(name)
                puts v.name
                brands.push(v)
            end
        end

        brands

    end

    def self.filterboth(name, country)
        brands = []

        country = country.downcase
        name = name.downcase

        for v in Brand.all
            ap = v.country.downcase
            at = v.name.downcase
            if ap.include?(country) and at.include?(name)
                brands.push(v)
            end
        end

        brands

    end
end
