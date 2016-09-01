require 'pry'                 # => true
require_relative 'final_key'  # => true

class Cipher
  attr_reader :offset, :keygen, :key, :final_key, :characters, :pairs  # => nil


  def initialize
    @key = FinalKey.new                # => #<FinalKey:0x007fe22482e868 @key=#<KeyGen:0x007fe22482e840>, @offset=#<Offset:0x007fe22482e818 @time=2016-09-01 00:22:38 -0600, @square=nil, @date=nil>, @first_key=[], @offset_holder=[], @final_key=[]>
    @first_key = @key.combine          # => [85, 15, 58, 58]
    @final_key = @key.final_key        # ~> TypeError: nil can't be coerced into Fixnum
    @user_key = KeyGen.new
    @manual_key = @user_key.key_gen()
    @pairs = pairs
  end                                  # => :initialize

  def alpha
    @characters = (' '..'Z').to_a
  end                              # => :alpha

  def rotate_1
      rotated_characters = alpha.rotate(@final_key[0])
      @pairs = alpha.zip(rotated_characters).to_h
  end                                                   # => :rotate_1

  def rotate_2
      rotated_characters = alpha.rotate(@final_key[1])
      @pairs = alpha.zip(rotated_characters).to_h
  end                                                   # => :rotate_2

  def rotate_3
      rotated_characters = alpha.rotate(@final_key[2])
      @pairs = alpha.zip(rotated_characters).to_h
  end                                                   # => :rotate_3

  def rotate_4
      rotated_characters = alpha.rotate(@final_key[3])
      @pairs = alpha.zip(rotated_characters).to_h
  end                                                   # => :rotate_4

  def encrypt_at_1(letter)
    @pairs[letter.upcase]
  end                       # => :encrypt_at_1

  def encrypt_at_2(letter)
    @pairs[letter.upcase]
  end                       # => :encrypt_at_2

  def encrypt_at_3(letter)
    @pairs[letter.upcase]
  end                       # => :encrypt_at_3

  def encrypt_at_4(letter)
    @pairs[letter.upcase]
  end                       # => :encrypt_at_4

  def print_key
    puts "#{@final_key}"
    return @final_key
  end                     # => :print_key

end              # => :print_key
# c = Cipher.new
# c.rotate_1('A')

# ~> TypeError
# ~> nil can't be coerced into Fixnum
# ~>
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:28:in `+'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:28:in `block in final_key'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `map'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `with_index'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `final_key'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/cipher.rb:11:in `initialize'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/cipher.rb:63:in `new'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/cipher.rb:63:in `<main>'
