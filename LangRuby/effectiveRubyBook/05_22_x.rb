=begin

##22
Use block forms for IO

=end

# Non block form
# your responsible to close
#
f = File.open("/temp/file.txt", "w")
f.write("bees")
f = nil

f = File.open("/temp/file.txt")
p f.read
p "the above returns empty file because the data written has been lost, because file has not been flused"

# block form
# guarantees - the file will be flushed and closed as soon as the block returns
#
File.open("/temp/file2.txt", "w") do |fp|
  fp.write("bees")
end

f = File.open("/temp/file2.txt")
p f.read

# read mode also has a block form
File.open("/temp/file2.txt", "r") do |fp|
  p fp.read
end