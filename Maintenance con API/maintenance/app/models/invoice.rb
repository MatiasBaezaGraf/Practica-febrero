class Invoice < ActiveResource::Base
	self.site = "http://localhost:3001/"

	has_many :invoice_items

	def price
		count = 0
		for i in InvoiceItem.all
			if i.invoice == self
				total = i.unit_price * i.quantity
				count = count + total
			end
		end
		count
	end

	def self.filterbrand(brand_id)
        invoices = []

        for i in Invoice.all
            for j in InvoiceItem.all
                if j.invoice == i and j.replacement.brand.id.to_i == brand_id.to_i
                    count = 0
                    for v in invoices
                        if v == i
                            count = count + 1
                        end
                    end
                    if count == 0
                        invoices.push(i)
                    end
                end
            end
        end

        invoices

    end

	def self.filterreplacement(replacement_id)
        invoices = []

        for i in Invoice.all
            for j in InvoiceItem.all
                if j.invoice == i and j.replacement.id.to_i == replacement_id.to_i
                    count = 0
                    for v in invoices
                        if v == i
                            count = count + 1
                        end
                    end
                    if count == 0
                        invoices.push(i)
                    end
                end
            end
        end

        invoices

    end

    def self.filterthan(price, option)
    	a = Array.new
    	for i in Invoice.all
    		if option.to_i == 0 and i.price.to_f <= price.to_f
    			a.push(i)
    		elsif option.to_i == 1 and i.price.to_f >= price.to_f
    			a.push(i)
    		end
    	end
    	a
    end
end
