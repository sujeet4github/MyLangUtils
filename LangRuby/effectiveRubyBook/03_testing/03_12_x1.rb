# raise exceptions regardless of test framework
# test finishes eagerly if it fails
# other assertions/expectations will not run if one fails

# principle: One expectation per test
#  simplifies reading of the test, test is obvious
#  if one test fails, no other failures are masked

# composed matchers in Rspec 3, for complicated structure to follow the single assertion rule

# see spec/1_spec.rb
# run using:
p 'run using: > rspec spec/1_spec.rb'