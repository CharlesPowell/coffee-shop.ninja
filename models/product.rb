class Product < ActiveRecord::Base
	def to_s
		"Product: #{self.name}"
	end
end
