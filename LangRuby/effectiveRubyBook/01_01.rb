
# Objects that inherit from Object implement #dup
#		#dup returns a shallow copy of its receiver  [1]

# Collections are passed by reference  [2]

# ER-1 for arrays/hashes
# [1], [2] => without duplication Object Encapsulation may be broken

class ValidatesConstructorArguments
	
	def initialize(potentially_invalid_array)
		
		# [ER-1 for arrays/hashes]
		# dont do this...
		# @potentially_invalid_array = potentially_invalid_array
		# do this instead...
		@potentially_invalid_array = potentially_invalid_array.dup
		
		raise ArgumentError.new("the passed array is invalid") \
			unless validate_every_array_element_is_a_string?
	
	end

	def transform
		@potentially_invalid_array.map { |x| x.upcase }.join(",")
	end

	private
	
	attr_reader :potentially_invalid_array
	
	def validate_every_array_element_is_a_string?
		@potentially_invalid_array.all? { |x| String === x }
	end

end

# Test for ValidatesConstructorArguments
array = ["string", "string", "string"]
vca = ValidatesConstructorArguments.new(array)
# mess up array, by adding a number
array << 1
vca.transform
# without the dup in constructor, this would have blown up trying to
# to do upcase on number 1


class HashSelector
	def initialize(hash)
		# [ER-1 for arrays/hashes]
		# dont do this...
		@hash = hash
		# do this instead...
		@hash = hash.dup
	end
	
	def meaningful_keys
		@hash.select! { |k,v| k == :valid }
		
		#Note: select! mutates the hash
	end
	
	private
	
	attr_reader :hash
end

# Test for HashSelector
hash = { :invalid => :value1 , :valid => :value2 }
a = HashSelector.new( hash )
p a.meaningful_keys
# hash would also be modified because of side-effects of method a.meaningful_keys,
# if there were no dup in constructor
p hash


class RandomMatrix
	def initialize(w, h)
		@matrix = []
		h.times do |i|
			matrix << []
			w.times do
				matrix[i] << rand
			end
		end
	end

	def row(i)
		# [ER-1 for arrays/hashes]
		# dont do this...
		# matrix[i]
		# do this instead...
		matrix[i].dup
	end
	
	private
	
	attr_reader :matrix
end

m = RandomMatrix.new(3,4)
p m.row(1)
p m.row(1)[0]
# without the dup in row method, this would have messed up the classes internal matrix
m.row(1)[0] = 999999
p m.row(1)[0]

