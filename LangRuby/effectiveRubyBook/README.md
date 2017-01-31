Source:
- [Safari Book Video](http://my.safaribooksonline.com/video/programming/ruby/9780134175416)
- by [Sam Phippen](https://github.com/samphippen)
- Code at: [Sam Phippen github](https://github.com/samphippen/efrll)

#1 - Arrays And Hashes
##1
Duplicate collections you receive as arguments
or encapsulated collections or parts there of you want to expose
(see RandomMatrix in 01_01.rb)

##2
Use Set for efficient presence checks

##3
Consider using a default hash value

##4
Use Hash#fetch over Hash#[]

##5
prefer decorating collections instead of inheriting from collection classes

#2 - Seams

##6
Avoid using class variables
  class variables ==> static variables

##7
Avoid using class methods
  class methods ==> static methods

##8
Obey the law of Demeter
	should not call methods on nested objects available to you
	 exception for self or objects of same type

##9
Prefer methods over instance variables

##10
Prefer methods over constants
	constants:
		- are shared, global
		- mutable if the constant is a collection
		- cannot be replaced by behavior later

##11
Use the === protocol for matching tasks
	universal *match* protocol
	supported for:
		classes (subclass), regex (matches), ranges (part of range),
		lambda (calls lambda for custom implementation)
	

#3 - Testing
##12
Use only one assertion or expectation per test

##13
Order your tests with the arrange, act and assert pattern

##14
Run your tests in a random order

##15
Prefer spies to mocks or stubs

##16
Use Rack::Test for integration testing

#4 - Enumerables and Callables
##17
Prefer Enumerable methods
###17.1
Use zip and each_with_index
###17.2
Use each_slice and each_con
###17.3
Use partition, select and find
###17.4
Use group_by, reduce and each_with_object
###17.5
Implement your own enumerable

##18
Prefer lambda instead of proc

##19
Use Symbol#to_proc when appropriate

##20
Use #method to pass instance methods as callables

##21
Use {} for blocks that return and do..end for blocks that mutate

#5 - The Standard Library
##22
Use block forms for IO

##23
Understanding the difference between Time, DateTime and Date

##24
Do HTTP requests with Net::HTTP

##25
Prefer file methods over manual path manipulation
###25.1
Use #absolute_path, #dirname, and __FILE__ to be OS independent
###25.2
Use File.extname to determine file type
###25.3
Use File.join to build file paths safely
