# method is a method available to all objects

class ReallyComplexStringTransform
  def transform(string)
    a = string.upcase
    a += "ifojoweiqfjqwoiefjoq"
    a[4] = "f"
    a
  end
end


strings = ["single", "page", "web", "apps", "don't", "work"]

p " using #method to get a *pointer/reference* to the transform method"
t = ReallyComplexStringTransform.new.method(:transform)

# pass the pointer to method to the map
strings.map(&t).each do |new_string|
  p new_string
end

p "This will not work if the class already defines a method called method"
p "this is very common for http libraries"

t1 = ReallyComplexStringTransform.new.method(:transform).call("String")
t2 = ReallyComplexStringTransform.new.send(:transform, "String")
#
p t1 == t2
