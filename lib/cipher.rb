require 'pry'                 # => true
require_relative 'final_key'  # => true
# require './lib/offset'

class Cipher
  attr_reader :offset, :keygen, :key  # => nil
  attr_writer :key                    # => nil
  def initialize
    # @offset = Offset.new              # => #<Offset:0x007fcd9485d298 @time=2016-08-29 17:06:46 -0600>
    @key = FinalKey.new               # => #<FinalKey:0x007fe55b855758 @key=#<KeyGen:0x007fe55b8556e0>, @offset=#<Offset:0x007fe55b8556b8 @time=2016-08-29 17:33:11 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
    @first_key = @key.combine         # => [76, 30, 83, 74]
    @final_key = @key.final_key       # => [81, 38, 88, 80]
  end                                 # => :initialize

  def alpha
    characters = ('A'..'Z').to_a  # => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end                             # => :alpha

  def a_value
    a_val = @final_key[0]
  end                      # => :a_value

  def b_value
    a_val = @final_key[1]
  end                      # => :b_value

  def c_value
    a_val = @final_key[2]
  end                      # => :c_value

  def d_value
    a_val = @final_key[3]
  end                      # => :d_value

  def rotate_1
    rotated_characters = alpha.rotate(@final_key[0])  # => ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "A", "B", "C"]
    pairs = alpha.zip(rotated_characters).to_h        # => {"A"=>"D", "B"=>"E", "C"=>"F", "D"=>"G", "E"=>"H", "F"=>"I", "G"=>"J", "H"=>"K", "I"=>"L", "J"=>"M", "K"=>"N", "L"=>"O", "M"=>"P", "N"=>"Q", "O"=>"R", "P"=>"S", "Q"=>"T", "R"=>"U", "S"=>"V", "T"=>"W", "U"=>"X", "V"=>"Y", "W"=>"Z", "X"=>"A", "Y"=>"B", "Z"=>"C"}
    # Hash[pairs]
  end                                                 # => :rotate_1

  def rotate_2
    rotated_characters = alpha.rotate(@final_key[1])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end                                                 # => :rotate_2

  def rotate_3
    rotated_characters = alpha.rotate(@final_key[2])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end                                                 # => :rotate_3

  def rotate_4
    rotated_characters = alpha.rotate(@final_key[3])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end                                                 # => :rotate_4

  def encrypt_at_1(letter)
    uppercase_letter = letter.upcase  # => "A"
    rotate_1[uppercase_letter]        # => "D"
  end                                 # => :encrypt_at_1

  def encrypt_at_2(letter)
    uppercase_letter = letter.upcase
    rotate_2[uppercase_letter]
  end                                 # => :encrypt_at_2

  def encrypt_at_3(letter)
    uppercase_letter = letter.upcase
    rotate_3[uppercase_letter]
  end                                 # => :encrypt_at_3

  def encrypt_at_4(letter)
    uppercase_letter = letter.upcase
    rotate_4[uppercase_letter]
  end                                 # => :encrypt_at_4

  def print_key
    @first_key
    @final_key = @key.final_key
  end                            # => :print_key
# binding.pry

end  # => :print_key

c = Cipher.new  # => #<Cipher:0x007fe55b855780 @key=#<FinalKey:0x007fe55b855758 @key=#<KeyGen:0x007fe55b8556e0>, @offset=#<Offset:0x007fe55b8556b8 @time=2016-08-29 17:33:11 -0600, @date=290816, @square=84573945856, @offset=[5, 8, 5, 6]>, @first_key=[76, 30, 83, 74], @offset_holder=[5, 8, 5, 6], @final_key=[81, 38, 88, 80]>, @first_key=[76, 30, 83, 74], @final_key=[81, 38, 88, 80]>

c.alpha              # => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
c.encrypt_at_1("a")  # => "D"
#
# binding.pry
