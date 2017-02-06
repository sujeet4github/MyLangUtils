
class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      ki = @key[key_index]
      encrypted_char = clear_char.ord ^ ki.ord
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end
