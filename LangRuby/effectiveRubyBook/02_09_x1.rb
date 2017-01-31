# Instance Variables
#
# - state of an object
# - accessible without behavior
# - have no access or write time validations
# - special syntax for accessing
#

# preferring methods
# - trival case can be implemented with a protected attr_accessor

class ValidatesArrays
	def initialize(array)
		@array = array
	end
	
	def valid?
		# pattern:
		# dont use @array directly - use array which is an access method
		#
		array.any? { |x| x == 1 }
	end
	
	private

	# pattern - prefer methods over instance variables
	def array
		@array || []
	end

end

v = ValidatesArrays.new(nil)
p v.valid?