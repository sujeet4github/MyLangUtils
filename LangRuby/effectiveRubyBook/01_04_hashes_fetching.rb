# Prefer to use Hash#fetch over Hash#[]

a = {}

# The hash[key] sends the #[] instance method to the hash
## returns nil (or default value) if key is missing
p a[:missing]

# the hash.fetch(key) raises an exception if the key is missing
## no implicit nil
begin
	p a.fetch(:missing)
rescue => e
 	p $!, $@, "ignoring exception: [" + e.message + "]"
end

# the hash.fetch(key) can return a default value
p a.fetch(:missing, "a default value for missing key")


# the hash.fetch(key) can call a block if the key is not present
a[:key]=10
p a.fetch(:key) { p "this block won't run" }

p a.fetch(:missing) { |h,n| "this block won't run, but it ran because key was `#{h}`" }
