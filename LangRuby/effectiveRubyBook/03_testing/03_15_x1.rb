# Prefer spies to mocks or stubs

#Principle: Isolate test collaborator from object under test

# stub is the simplest
#  - replace 1 of the methods of an object with a stubbed implementation
#  drawbacks: 
#    1. easy to incorrectly modify objects you dont control
#    2. if not careful, can give you a test system which tests nothing real

# mocks
#  - like stubs, replace implementation of the real object with a mocked implementation
#  drawbacks: 
#    1. violate the arrange-act-assert pattern
#	   2. same drawbacks as stubs
# good for API contract tests

# spies
#  - are objects in their own rights
#  - allows you to record method calls
#  drawbacks: 
#		1. necessitate some dependency injection
# good for API contract tests while following arrange-act-assert pattern

# see spec/{ 5_stubs_spec.rb , 6_mocks_spec.rb , 7_spies_spec.rb }
# run using:
p 'run using:'
p '> rspec spec/5_stubs_spec.rb'
p '> rspec spec/6_mocks_spec.rb'
p '> rspec spec/7_spies_spec.rb'
