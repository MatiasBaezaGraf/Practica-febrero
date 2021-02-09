class Cart < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :item_carts

    validates :bill_date, presence: true

    def finalprice
    	price = 0
    	for i in ItemCart.all
    		if i.cart == self
    			count = i.price
    			price = price + count
    		end
    	end
    	price
    end

    def self.filtername(user_name)
        carts = []

        user_name = user_name.downcase

        for v in Cart.all
            ap = v.user_name.downcase
            if ap.include?(user_name)
                puts v.user_name
                carts.push(v)
            end
        end

        carts

    end

    def self.filterbrand(brand_id)
        carts = []

        for c in Cart.all
            for i in ItemCart.all
                if i.cart == c and i.component.brand.id.to_i == brand_id.to_i
                    carts.push(c)
                end
            end
        end

        carts

    end

    def self.filterfromto(from, to)
        carts = []
        if (from == "" ) or (to == "")
            carts = Cart.all
        else
            from = from.to_date
            to = to.to_date
            for v in Cart.all
                condition = 0
                if (v.bill_date.to_date > from)
                    condition = condition + 1
                end

                if (v.bill_date.to_date < to)
                    condition = condition + 1
                end

                if (condition == 2)
                    carts.push(v)
                end
            end
            carts
        end

    end

    def self.filterprice(max)
        carts = []

        max = max.to_f

        for i in Cart.all
            if i.finalprice < max
               carts.push(i) 
            end 
        end

        carts
    end

    def self.filterperunit(min, max)
        carts = []

        min = min.to_f
        max = max.to_f

        for c in Cart.all
            for i in ItemCart.all
                if i.cart == c and i.unit_price >= min and i.unit_price <= max
                    count = 0
                    for j in carts
                        if j == c
                            count = count + 1
                        end
                    end

                    if count == 0
                        carts.push(c)
                    end
                end
            end
        end

        carts
    end
end
