#Avoid using class variables
#  class variables ==> static variables
class Foo
	# static/class
	@@b = 2
	
	def initialize
		@@b = 0
	end
	
	def bar
		@@b += 1
		@@b
	end
end

f1 = Foo.new

p f1.bar

f2 = Foo.new

p f2.bar
p f1.bar

