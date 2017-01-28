# hash can be constructed using {} or Hash.new
# returns nil for non-existent key
# Hash.new(value), returns value for non-existed keys
# Hash.new { |hash,key| ... } invoke block for n

some_words = "Single page web apps don't work on the web"

# construct new hash using {} syntax
result = {}
some_words.split(" ").each do |word|
	# lazily initialize to 0
  result[word] ||= 0
  result[word] += 1
end

p result

# construct new hash using Hash.new using 0 as default value (for nonexistent keys)
result = Hash.new(0)
some_words.split(" ").each do |word|
  result[word] += 1
end

p result

# construct new hash passing in a block to be invoked for nonexistent key
result = Hash.new { |hash,key| hash[key] = 0 }
some_words.split(" ").each do |word|
  result[word] += 1
end

p result


# Instead of counting words, store indexes of where the word exists
#
result = Hash.new { |hash,key| hash[key] = [] }
some_words.split(" ").each_with_index do |word, index|
  result[word] << index
end

p "--------"
p result
p "--------"