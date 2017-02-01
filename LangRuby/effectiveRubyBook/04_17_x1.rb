require "set"

##17 - Prefer Enumerable methods
# Enumerable - is a mixin in standard library
#  number of standard traversable methods
# 

# ===============================================
###17.1 - Use zip and each_with_index
# zip
p [1,2,3].zip([2,3,4])

a = [1,2,3]
b = [3,4,5]

p a.zip(b)
# lazily evaluate...
p a.lazy.zip(b)

# lazy and eager both return the same thing...
p "eager ..."
a.zip(b).each do |pair|
  p pair
end
p "lazy ..."
a.lazy.zip(b).each do |pair|
  p pair
end

p "---------------"
p "mismatched sizes -> argument (2nd value) 's size determines the size of output"
longer = [1,2,3,4,5]
p longer.zip(a)
p a.zip(longer)

p "---------------"
p "also works on sets"
b = Set.new([1,2,3, 8])

p b.zip(a)

p "---------------"
p "also works on hashes"

a_hash = {:a => 1, :b => 2, :c => 3}

p "result is an array, hash converts to array of k,v pairs"
p a.zip(a_hash)
a_hash.each do |item|
  p item
end

p "==========="
# ===============================================
# each_with_index

collection = [17, 19, 12, 31]

# (lazy ->) does not compute the values until they are needed
p collection.each_with_index

p "---------------"

collection.each_with_index do |item_from_collection, index|
  puts ["item", item_from_collection, "index", index].join(" ")
end


p "---------------"
p "also works on sets"
collection = Set.new([18,28,38,48,58,68,78, 78])

collection.each_with_index do |item_from_collection, index|
  puts ["item", item_from_collection, "index", index].join(" ")
end

p "---------------"
p "also works on hashes"

hash = {
  :a => 1,
  :c => 2,
  :d => 3,
}

hash.each_with_index do |item_from_collection, index|
  puts ["item", item_from_collection, "index", index].join(" ")
end

p "==========="
# ===============================================
###17.2 Use each_slice and each_con
p "each_slice: for grouping elements from an enumerable, lazy"

a = [1,2,3,4,5,6,7,8]

p a.each_slice(2).to_a
p "---------------"

p " works on sets"
s = Set.new((1...18))
s.add(3)
s.add(3)
p s.each_slice(3).to_a

p "---------------"

p " works on hashes"
h = {
  :a => 1,
  :b => 2,
  :c => 3,
}
p h.each_slice(2).to_a

p "---------------"
p "each_con: for grouping elements from an enumerable"
p " provides a window of passed size over the enumerable, lazy"

p a.each_cons(2).to_a

p " works on sets"
p s.each_cons(3).to_a

p " works on hashes"
p h.each_cons(2).to_a

p "==========="
# ===============================================
###17.3 - Use partition, select and find
# partition, select, reject, find
# - finding items in a Enumerable
# - predicate blocks are passed to these
#
a = [1,2,3,4,5,6,7,8]

matches, does_not_match = a.partition { |x| x.even? }
p matches, does_not_match

p "---------------"
p "not lazy inspite of a.lazy, because partition requires a full scan"
p a.lazy.partition { |x| x.even? }

p "---------------"
p "works on sets"
s = Set.new(["hello", "Hello World", "world"])

p "demonstrates unpacking syntax of ruby"
matches, does_not_match = s.partition { |x| x.downcase.include?("world") }
p matches, does_not_match

p "---------------"
p "works on hashes"
matches, does_not_match = h.partition { |key, value| key == :a }
p "matches: ", matches
p "non matches: ", does_not_match

# make it a Hash again
p Hash[matches]

p "---------------"
p a.select { |x| x.even? }
p a.lazy.select { |x| x.even? }.to_a
a << 18
a << 17
p a.select { |x| x.even? }
p "---------------"
p "works on sets"
p s.lazy.select { |x| x.downcase.include?("world") }.to_a
p "---------------"
p "works on hashes, NOTE: returns a hash"
p h.select{ |key, value| key == :a }.to_a
p "---------------"
p "special modify in place"
p a.select! { |x| x.even? }
p a
p "---------------"
a << 18
a << 17
p a
p a.object_id
p a.select! { |x| x.even? }
p a
p a.object_id
p a.select { |x| x.even? }.object_id
p "note object_id's above same for select!, but different for select"
p "---------------"
p "reject is the opposite of select"
a = [1,2,3,4,5,6,7,8]
p a.reject { |x| x.even? }
p a.lazy.reject { |x| x.even? }
p a.lazy.reject { |x| x.even? }.to_a
p "---------------"
p "works on sets"
s = Set.new((1...18))
s.add(3)
s.add(33)
p s.reject { |x| x % 3 == 0 }
p "works on hashes, NOTE: returns a hash"
p h.reject{ |key, value| key == :a }.to_a
p "note reject! works equivalently to select!"
p "---------------"
p "find - finds the first value that matches the predicate"
a = [1,2,3,4,5,6]
p a.find { |x| x.even? }
p "---------------"
p a.lazy.find { |x| x.even? }
p "---------------"
p "works on sets"
s = Set.new([1,2,3,4])
p s.find { |x| x.even? }
p "---------------"
p "works on hashes"
p h.find { |key, value| key == :a }
p h.find { |key, value| value == 3 }

p "==========="
# ===============================================
###17.4 - Use group_by, reduce and each_with_object
#
# group_by, reduce, each_with_object
#  - transforms a collection into other collections/values
#  - real-life ruby - common use is to produce a hash from the collection
#  - block can return any value
p "group_by always produces a hash:"
p " - keys are the results of the predicate"
p " - values was the value sent into the predicte"
a = [1,2,3,4,5,6,7]
p a.group_by { |x| x % 3 }
p a.group_by { |x| x.even? }
p "---------------"
s = Set.new(["some words", "different words", "some other words"])
p s.group_by { |x| x.split(" ").first }
p s.group_by { |x| x.split(" ").count }
p "---------------"
p "reduce takes a initial/default accumulator value and a block"
# "add up array"
p a.reduce(:+)
# "add up array, starting with 3"
p a.reduce(3, :+)
# "add up array, starting with 3, same as the above statement"
p a.reduce(3, &:+)
p "---------------"
a = ["some", "strings", "some", "more", "strings"]
p a.reduce(Hash.new(0)) { |accumulator, value|
  accumulator[value] += 1
  accumulator
}
p "---------------"
p a.each_with_index.reduce(Hash.new { |h,k| h[k] = [] }) { |accumulator, value_and_index|
  value,index = value_and_index
  accumulator[value] << index
  accumulator
}
p "---------------"
a = [1,2,3,4,5,6]
p "implementing select using reduce"
p a.reduce([]) { |accumulator, value|
  if value.even?
    accumulator << value
  end

  accumulator
}
p "---------------"
p "each_with_object takes a mutable object and a block, the idea is the block modifies the object, and this object is returned after iterating through the collection"
result = a.each_with_object(0) do |item, object|
  object += item
end
p "result is always 0, because the object passed - integer with value 0 is not mutable"
p result
p "---------------"
class Counter
  def increment(n)
    @count ||= 0
    @count += n
  end

  def count
    @count
  end
end
result = a.each_with_object(Counter.new) do |item, object|
  object.increment(item)
end
p result.count
p "---------------"
s = ["some", "strings", "some", "more", "strings"]
result = s.each_with_object(Hash.new(0)) do |item, object|
  object[item] += 1
  #no accumulator return unlike reduce
end
p result

p "---------------"
###17.5 - Implement your own enumerable
p "simple example"
class StaticCollection
  include Enumerable

  def each(&blk)
    blk.call(1)
    blk.call(2)
    blk.call(3)
  end
end

StaticCollection.new.each do |item|
  p item
end


p "----------"
p StaticCollection.new.select {|x| x.even? }
p StaticCollection.new.reduce(:+)
p "----------"

class DynamicCollection
  include Enumerable
  
  def each(&blk)
    10.times do
      blk.call(rand)
      #could be file io, network, etc
      sleep(rand*0.1)
    end
  end
end
p DynamicCollection.new.reduce(:+)
p DynamicCollection.new.select { |x| x < 0.99 }
