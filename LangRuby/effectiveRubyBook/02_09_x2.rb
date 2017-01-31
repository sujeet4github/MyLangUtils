class Factory

	def make

		"I am result number #{n}".tap {
			self.n += 1
		}
	end
	
	protected
	
	attr_writer :n
	
	def n
		# lazy initialization, init to 0 only if it is nil
		@n ||= 0
	end
end

f = Factory.new
p f.make
p f.make
p f.make
p f.make
p f.make
p f.make
p f.make
p f.make
