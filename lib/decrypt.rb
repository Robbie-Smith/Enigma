require 'pry'               # => true
require_relative 'encrypt'  # => true

class Decrypt
  attr_reader :pairs        # => nil
  def initialize
    # @encrypt = Encryptor.new
    @cipher = Cipher.new    # => #<Cipher:0x007fb04b8e2170 @key=#<FinalKey:0x007fb04b8e2148 @key=#<KeyGen:0x007fb04b8e20d0>, @offset=#<Offset:0x007fb04b8e20a8 @time=2016-08-29 17:58:57 -0600, @date=290816, @square=84573945856, @offset=[5, 8, 5, 6]>, @first_key=[38, 83, 75, 11], @offset_holder=[5, 8, 5, 6], @final_key=[43, 91, 80, 17]>, @first_key=[38, 83, 75, 11], @final_key=[43, 91, 80, 17]>
    @alpha = @cipher.alpha  # => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end                       # => :initialize

  # def test
  #   @encrypt.encrypt("hello")
  # end                          # => :test
  #
  def rotate_1(num_1)                             # ~> ArgumentError: wrong number of arguments (given 0, expected 1)
    rotated_characters = @alpha.rotate(num_1)     # => ["J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I"]
    @pairs = @alpha.zip(rotated_characters).to_h  # => {"A"=>"J", "B"=>"K", "C"=>"L", "D"=>"M", "E"=>"N", "F"=>"O", "G"=>"P", "H"=>"Q", "I"=>"R", "J"=>"S", "K"=>"T", "L"=>"U", "M"=>"V", "N"=>"W", "O"=>"X", "P"=>"Y", "Q"=>"Z", "R"=>"A", "S"=>"B", "T"=>"C", "U"=>"D", "V"=>"E", "W"=>"F", "X"=>"G", "Y"=>"H", "Z"=>"I"}
  end                                             # => :rotate_1

  def rotate_2(num_2)
    rotated_characters = @alpha.rotate(num_2)     # => ["B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "A"]
    @pairs = @alpha.zip(rotated_characters).to_h  # => {"A"=>"B", "B"=>"C", "C"=>"D", "D"=>"E", "E"=>"F", "F"=>"G", "G"=>"H", "H"=>"I", "I"=>"J", "J"=>"K", "K"=>"L", "L"=>"M", "M"=>"N", "N"=>"O", "O"=>"P", "P"=>"Q", "Q"=>"R", "R"=>"S", "S"=>"T", "T"=>"U", "U"=>"V", "V"=>"W", "W"=>"X", "X"=>"Y", "Y"=>"Z", "Z"=>"A"}
  end                                             # => :rotate_2

  def rotate_3(num_3)
    rotated_characters = @alpha.rotate(num_3)     # => ["Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
    @pairs = @alpha.zip(rotated_characters).to_h  # => {"A"=>"Z", "B"=>"A", "C"=>"B", "D"=>"C", "E"=>"D", "F"=>"E", "G"=>"F", "H"=>"G", "I"=>"H", "J"=>"I", "K"=>"J", "L"=>"K", "M"=>"L", "N"=>"M", "O"=>"N", "P"=>"O", "Q"=>"P", "R"=>"Q", "S"=>"R", "T"=>"S", "U"=>"T", "V"=>"U", "W"=>"V", "X"=>"W", "Y"=>"X", "Z"=>"Y"}
  end                                             # => :rotate_3

  def rotate_4(num_4)
    rotated_characters = @alpha.rotate(num_4)     # => ["R", "S", "T", "U", "V", "W", "X", "Y", "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q"]
    @pairs = @alpha.zip(rotated_characters).to_h  # => {"A"=>"R", "B"=>"S", "C"=>"T", "D"=>"U", "E"=>"V", "F"=>"W", "G"=>"X", "H"=>"Y", "I"=>"Z", "J"=>"A", "K"=>"B", "L"=>"C", "M"=>"D", "N"=>"E", "O"=>"F", "P"=>"G", "Q"=>"H", "R"=>"I", "S"=>"J", "T"=>"K", "U"=>"L", "V"=>"M", "W"=>"N", "X"=>"O", "Y"=>"P", "Z"=>"Q"}
  end                                             # => :rotate_4


  def decrypt(new_word)
    counter=0                                         # => 0
  word = new_word.split(%r{\s*}).map! do |letter|     # => ["Q", "F", "K", "C", "X"]
      if counter == 0                                 # => true
        counter+=1                                    # => 1
        rotate_1
        rotated_characters = @alpha.rotate(num_1)
        @pairs = @alpha.zip(rotated_characters).to_h
        @pairs.key(letter)
      elsif counter == 1
        counter+=1
        @cipher.rotate_2.key(letter)
      elsif counter == 2
        counter+=1
        @cipher.rotate_3.key(letter)
      elsif counter == 3
        counter = 0
        @cipher.rotate_4.key(letter)
      end
    end
    word.join
  end                                                 # => :decrypt
end                                                   # => :decrypt

d = Decrypt.new     # => #<Decrypt:0x007fb04b8e2198 @cipher=#<Cipher:0x007fb04b8e2170 @key=#<FinalKey:0x007fb04b8e2148 @key=#<KeyGen:0x007fb04b8e20d0>, @offset=#<Offset:0x007fb04b8e20a8 @time=2016-08-29 17:58:57 -0600, @date=290816, @square=84573945856, @offset=[5, 8, 5, 6]>, @first_key=[38, 83, 75, 11], @offset_holder=[5, 8, 5, 6], @final_key=[43, 91, 80, 17]>, @first_key=[38, 83, 75, 11], @final_key=[43, 91, 80, 17]>, @alpha=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]>
d.rotate_1(61)      # => {"A"=>"J", "B"=>"K", "C"=>"L", "D"=>"M", "E"=>"N", "F"=>"O", "G"=>"P", "H"=>"Q", "I"=>"R", "J"=>"S", "K"=>"T", "L"=>"U", "M"=>"V", "N"=>"W", "O"=>"X", "P"=>"Y", "Q"=>"Z", "R"=>"A", "S"=>"B", "T"=>"C", "U"=>"D", "V"=>"E", "W"=>"F", "X"=>"G", "Y"=>"H", "Z"=>"I"}
d.rotate_2(79)      # => {"A"=>"B", "B"=>"C", "C"=>"D", "D"=>"E", "E"=>"F", "F"=>"G", "G"=>"H", "H"=>"I", "I"=>"J", "J"=>"K", "K"=>"L", "L"=>"M", "M"=>"N", "N"=>"O", "O"=>"P", "P"=>"Q", "Q"=>"R", "R"=>"S", "S"=>"T", "T"=>"U", "U"=>"V", "V"=>"W", "W"=>"X", "X"=>"Y", "Y"=>"Z", "Z"=>"A"}
d.rotate_3(25)      # => {"A"=>"Z", "B"=>"A", "C"=>"B", "D"=>"C", "E"=>"D", "F"=>"E", "G"=>"F", "H"=>"G", "I"=>"H", "J"=>"I", "K"=>"J", "L"=>"K", "M"=>"L", "N"=>"M", "O"=>"N", "P"=>"O", "Q"=>"P", "R"=>"Q", "S"=>"R", "T"=>"S", "U"=>"T", "V"=>"U", "W"=>"V", "X"=>"W", "Y"=>"X", "Z"=>"Y"}
d.rotate_4(69)      # => {"A"=>"R", "B"=>"S", "C"=>"T", "D"=>"U", "E"=>"V", "F"=>"W", "G"=>"X", "H"=>"Y", "I"=>"Z", "J"=>"A", "K"=>"B", "L"=>"C", "M"=>"D", "N"=>"E", "O"=>"F", "P"=>"G", "Q"=>"H", "R"=>"I", "S"=>"J", "T"=>"K", "U"=>"L", "V"=>"M", "W"=>"N", "X"=>"O", "Y"=>"P", "Z"=>"Q"}
d.decrypt("QFKCX")

# >> [26, 76, 58, 53]

# ~> ArgumentError
# ~> wrong number of arguments (given 0, expected 1)
# ~>
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/decrypt.rb:16:in `rotate_1'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/decrypt.rb:42:in `block in decrypt'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/decrypt.rb:39:in `map!'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/decrypt.rb:39:in `decrypt'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/decrypt.rb:66:in `<main>'
