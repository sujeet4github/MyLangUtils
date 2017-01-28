# prefer decorating collections instead of inheriting from collection classes


# some interfaces in the collections have been written in C for performance
# these will not respect sub classes as would a regular ruby class
# mostly subtle issues
class ArrayLikeSubClass < Array
end
p "ArrayLikeSubClass"
p "-----------------"
a = ArrayLikeSubClass.new ( [1,3, 2] )
p a
p a.class
p a == [1, 3, 2]
p [1, 3, 2] == a
reversed_a = a.reverse
p reversed_a
p reversed_a.class
# Note the reverse is not able to sustain the illusion that this is not Array

# Hand writing delegation
p "ArrayLikeWithExplicitDelegation"
p "-------------------------------"
class ArrayLikeWithExplicitDelegation

  def initialize(somearray)
    @somearray = somearray.to_a.dup
  end

  def reverse
    self.class.new(somearray.reverse)
  end

  def inspect
    "#<ArrayLikeWithExplicitDelegation:#{somearray.inspect}>"
  end

  def to_a
    somearray.dup
  end

  private

  attr_reader :somearray
end

a = ArrayLikeWithExplicitDelegation.new([1,2,3])
p a
a_reverse = a.reverse
p a.reverse
p a.reverse.class
a = ArrayLikeWithExplicitDelegation.new(a_reverse).reverse
p a

# delegate module in ruby
# ==========================
require 'delegate'

# useful for extending behavior of existing Ruby classes
p "ArrayLikeSimpleDelegator"
p "------------------------"
class ArrayLikeSimpleDelegator < SimpleDelegator
  def contains_only_even_numbers?
    all? {|x| x % 2 == 0 }
  end
end

a = ArrayLikeSimpleDelegator.new([2])
p a
a.each do |item|
  p item
end
p a.reverse.class
p a.contains_only_even_numbers?

# forwardable module in ruby
# ==========================
# restrict and enhance existing classes
require "forwardable"

class RaisingHash
  extend Forwardable
  include Enumerable

  def initialize(hash)
    @hash = hash
  end

	# these are the methods that will be delegated
  def_delegators(:@hash, :[], :[]=, :delete, :each,
                 :keys, :values, :length,
                 :empty?, :has_key?)
end

r = RaisingHash.new(:a => :b)

r[:a]
r[:b]

p r.respond_to?(:include)