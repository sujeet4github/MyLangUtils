require "set"

set = Set.new( [1, 1, 2, 3, 8] )

p set

set.each do |i|
	p i
end

p set.include? 8
p set.include? 9