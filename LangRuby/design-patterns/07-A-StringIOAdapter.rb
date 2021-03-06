require_relative "07-A-Encrypter"

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    return ch
  end

  def eof?
    return @position >= @string.length
  end
end

encrypter = Encrypter.new('XYZZY')
reader= StringIOAdapter.new('We attack at dawn')
#writer=File.open('out.txt', 'w')
#encrypter.encrypt(reader, writer)
encrypter.encrypt(reader, $stdout)
