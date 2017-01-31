# Idiomatic test ordering pattern

# principle: all tests have 3 steps
#  easier to understand

# 1. setup phase
#  create all objects, sut, mocks/stubs that will be used in test

# 2. exercise step
#  run the production code and generate test results
#   satisfies any mock (as a side-effect)

# 3. assert phase
#	 check test results
#  also query method calls from spies
#  manually validate mocks in MiniTest

# see spec/2_spec.rb
# run using:
p 'run using: > rspec spec/2_spec.rb'

# see spec/3_spec.rb
# run using:
p 'run using: > rspec spec/3_spec.rb'