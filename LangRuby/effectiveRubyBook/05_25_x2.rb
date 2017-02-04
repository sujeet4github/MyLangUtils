=begin

##25
Prefer file methods over manual path manipulation
###25.2
Use File.extname to determine file type

=end

# returns the extension name for a give file name, use this rather than string manipulation
f = File.extname(__FILE__)

p f

def file_allowed?(filename)
  extension = File.extname(filename)
  [".png", ".jpg", ".bmp"].include?(extension) && File.exists?(filename)
end

p file_allowed?("half_sam.png")
p file_allowed?("12factor.epub")