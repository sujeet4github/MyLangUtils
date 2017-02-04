a = [1,2,3,4]

p a.map { |i| i.to_s }
p a.map(&:to_s)

p a.map(&:even?)
p a.map { |i| i.even? }

p a.partition(&:even?)
p a.partition { |i| i.even? }