=begin

##25
Prefer file methods over manual path manipulation
###25.3
Use File.join to build file paths safely

=end

path_fragments = ["/tmp", "#{rand}", "hello.txt"]

filename = File.join(path_fragments)
p filename
directory = File.dirname(filename)

p directory

Dir.mkdir(directory)

File.open(filename, "w") do |fp|
  fp.write("hello world")
end
