require 'pry'
require_relative 'final_key'
# require './lib/offset'

class Cipher
  attr_reader :offset, :keygen, :key
  attr_writer :key
  def initialize
    @offset = Offset.new
    @key = FinalKey.new
    @final_key = @key.combine
  end

  def alpha
    characters = ('A'..'Z').to_a
  end

  def a_value
    a_val = @final_key[0]
  end

  def b_value
    a_val = @final_key[1]
  end

  def c_value
    a_val = @final_key[2]
  end

  def d_value
    a_val = @final_key[3]
  end

  def rotate_1
    rotated_characters = alpha.rotate(@final_key[0])
    pairs = alpha.zip(rotated_characters).to_h
    # Hash[pairs]
  end

  def rotate_2
    rotated_characters = alpha.rotate(@final_key[1])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def rotate_3
    rotated_characters = alpha.rotate(@final_key[2])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def rotate_4
    rotated_characters = alpha.rotate(@final_key[3])
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def encrypt_at_1(letter)
    uppercase_letter = letter.upcase
    rotate_1[uppercase_letter]
  end

  def encrypt_at_2(letter)
    uppercase_letter = letter.upcase
    rotate_2[uppercase_letter]
  end

  def encrypt_at_3(letter)
    uppercase_letter = letter.upcase
    rotate_3[uppercase_letter]
  end

  def encrypt_at_4(letter)
    uppercase_letter = letter.upcase
    rotate_4[uppercase_letter]
  end
# binding.pry

end

c = Cipher.new

c.alpha
c.encrypt_at_1("a")
#
# binding.pry
