items = [1,2,3,4,5]

# Does not Fail Law of Demeter, but complex and difficult to read
p items
		.map { |i| i+1 }
		.select { |i| i.even? }
		.map { |i| i*20 }
		.map(&:to_s)
		.select { |i| i.length < 3 }

#  but we can use same principle to reduce complexity and make it easier to read

# Give a name to each of the above maps and transforms
class MapsAndSelects
	
	def initialize(value)
		@value = value
	end
	
	def mapped_value
		((value + 1) * 20).to_s
	end

	def will_be_selected?
		(value + 1).even? && mapped_value.length < 3
	end
	
	private
	
	attr_reader :value
end

p items
		.map { |i| MapsAndSelects.new(i) }
		.select { |i| i.will_be_selected? }
		.map { |i| i.mapped_value }