=begin

##25
Prefer file methods over manual path manipulation
###25.1
Use #absolute_path, #dirname, and __FILE__ to be OS independent

=end

# returns the current file path (relative to current working directory)
this_file = __FILE__
p this_file
# dirname takes a file and returns the directory name, still relative
p File.dirname(this_file)
p File.absolute_path(__FILE__)

# to load code from new_file
# add this to the ruby file load path...
$: << File.dirname(File.absolute_path(__FILE__))
require "new_file"

p Foo.new