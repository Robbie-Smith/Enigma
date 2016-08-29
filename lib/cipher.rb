require 'pry'                 # => true
require_relative 'final_key'  # => true
# require './lib/offset'

class Cipher
  attr_reader :offset, :keygen, :key  # => nil
  attr_writer :key                    # => nil
  def initialize
    @offset = Offset.new              # => #<Offset:0x007fbccb8c5ac0 @time=2016-08-29 15:14:35 -0600>
    @key = FinalKey.new               # => #<FinalKey:0x007fbccb8c5700 @key=#<KeyGen:0x007fbccb8c56d8>, @offset=#<Offset:0x007fbccb8c56b0 @time=2016-08-29 15:14:35 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
    @final_key = @key.combine         # => [46, 88, 42, 52]
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
    rotated_characters = alpha.rotate(@final_key[0])  # => ["U", "V", "W", "X", "Y", "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"]
    pairs = alpha.zip(rotated_characters).to_h        # => {"A"=>"U", "B"=>"V", "C"=>"W", "D"=>"X", "E"=>"Y", "F"=>"Z", "G"=>"A", "H"=>"B", "I"=>"C", "J"=>"D", "K"=>"E", "L"=>"F", "M"=>"G", "N"=>"H", "O"=>"I", "P"=>"J", "Q"=>"K", "R"=>"L", "S"=>"M", "T"=>"N", "U"=>"O", "V"=>"P", "W"=>"Q", "X"=>"R", "Y"=>"S", "Z"=>"T"}
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
    rotate_1[uppercase_letter]        # => "U"
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
# binding.pry

end  # => :encrypt_at_4

c = Cipher.new  # => #<Cipher:0x007fbccb8c5ae8 @offset=#<Offset:0x007fbccb8c5ac0 @time=2016-08-29 15:14:35 -0600>, @key=#<FinalKey:0x007fbccb8c5700 @key=#<KeyGen:0x007fbccb8c56d8>, @offset=#<Offset:0x007fbccb8c56b0 @time=2016-08-29 15:14:35 -0600, @date=290816, @square=84573945856, @offset=[5, 8, 5, 6]>, @first_key=[41, 80, 37, 46], @offset_holder=[5, 8, 5, 6], @final_key=[46, 88, 42, 52]>, @final_key=[46, 88, 42, 52]>

c.alpha              # => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
c.encrypt_at_1("a")  # => "U"
#
# binding.pry
