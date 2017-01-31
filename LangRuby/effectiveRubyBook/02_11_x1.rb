# === is the universal *match* protocol
#
# case ... when
# lambdas, regexes, ranges, classes all implement it

# a === b asks "is b subsumed by a"

### Classes

# Object is base class for most objects

p Object === []
p [] === Object

p Object === {}

class MyClass
end
p Object === MyClass.new
p MyClass === MyClass.new


### Regex

p /ab/ === "babble"

### Ranges

p (1...8) === 3
p (1...8) === 0
p (1...8) === 19

class ValidatesEmails
	def initialize(email)
		@email=email
	end
	def valid?
		email_matcher === email
	end
	
	private
	
	attr_reader :email
	
	def email_matcher
		/.*@.*.co/
	end
end
p ValidatesEmails.new("bob@example.com").valid?

class EmailMatcher
	def ===(other)
		other.split("@").count == 2 &&
		other.split("@").last.include?(".")
	end
end
class ValidatesEmails2
	def initialize(email)
		@email=email
	end
	def valid?
		email_matcher === email
	end
	
	private
	
	attr_reader :email
	
	def email_matcher
		EmailMatcher.new
	end
end
p ValidatesEmails2.new("bob@example.com").valid?
