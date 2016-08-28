require 'pry'
require './lib/key_gen'
require './lib/offset'

class Cipher
  attr_reader :offset, :keygen, :key
  attr_writer :key
  def initialize
    @offset = Offset.new
    @keygen = Keygen.new
    @key  ||= Keygen.new.keygen_a
  end

  def alpha
    characters = ('A'..'Z').to_a
  end

  def offset
    @offset.offset
  end

  def a_value
    a_value1 = key[0, 2].join
    a_value2 = offset[0]
    a_val = [a_value1.to_i + a_value2.to_i]
  end

  def b_value
    a_value1 = key[1, 2].join
    a_value2 = offset[1]
    a_val = [a_value1.to_i + a_value2.to_i]
  end

  def c_value
    a_value1 = key[2, 2].join
    a_value2 = offset[2]
    a_val = [a_value1.to_i + a_value2.to_i]
  end

  def d_value
    a_value1 = key[3, 2].join
    a_value2 = offset[3]
    a_val = [a_value1.to_i + a_value2.to_i]
  end

  def rotate_a
    rotation = a_value[0]
    # characters = ('A'..'Z').to_a
    rotated_characters = alpha.rotate(rotation)
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def rotate_b
    rotation = b_value[0]
    # characters = ('A'..'Z').to_a
    rotated_characters = alpha.rotate(rotation)
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def rotate_c
    rotation = c_value[0]
    # characters = ('A'..'Z').to_a
    rotated_characters = alpha.rotate(rotation)
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def rotate_d
    rotation = d_value[0]
    # characters = ('A'..'Z').to_a
    rotated_characters = alpha.rotate(rotation)
    pairs = alpha.zip(rotated_characters)
    Hash[pairs]
  end

  def encrypt_at_a(letter)
    uppercase_letter = letter.upcase
    rotate_a[uppercase_letter]
  end

  def encrypt_at_b(letter)
    uppercase_letter = letter.upcase
    rotate_b[uppercase_letter]
  end

  def encrypt_at_c(letter)
    uppercase_letter = letter.upcase
    rotate_c[uppercase_letter]
  end

  def encrypt_at_d(letter)
    uppercase_letter = letter.upcase
    rotate_d[uppercase_letter]
  end
binding.pry

end

@cipher = Cipher.new

binding.pry
