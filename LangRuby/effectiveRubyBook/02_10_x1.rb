class Sample1
	# constant -> allcaps
	FOOS = [1,2,3]
	
	def does_something_with_foos
	
		# here, the select! mutates the FOOS array although it is a constant!
		
		FOOS.select! { |x| x %2 == 0 }
	end
	
	def does_something_with_foos_v2
	
		# here, although the select! mutates, it does not matter
		# since foosConstant is a method returning a constant value
		
		foosConstant.select! { |x| x %2 == 0 }
	end

	def foosConstant
		[1,2,3]
	end
end

c = Sample1.new

p Sample1::FOOS
p c.does_something_with_foos
p Sample1::FOOS

p c.foosConstant
p c.does_something_with_foos_v2
p c.foosConstant

