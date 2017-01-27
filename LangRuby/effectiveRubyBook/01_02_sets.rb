require "set"

#collection object built into ruby, but not included by default, hence require needed
# hash based
#  -> can only contain unique items
#  -> fast lookup

set = Set.new( [1, 1, 2, 3, 8] )

p set

set.each do |i|
	p i
end

p set.include? 8
p set.include? 9