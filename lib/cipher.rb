require 'pry'
require_relative 'final_key'

class Cipher
  attr_reader :offset, :keygen, :key, :final_key, :characters
  attr_accessor :pairs

  def initialize
    @key = FinalKey.new
    @first_key = @key.combine
    @final_key = @key.final_key
    @pairs = pairs
  end

  def alpha
    @characters = ('A'..'Z').to_a
  end

  def rotate_1(num_1 = 0)
    if num_1 == 0
      rotated_characters = alpha.rotate(@final_key[0])
      @pairs = alpha.zip(rotated_characters).to_h
    else
      rotated_characters = alpha.rotate(num_1)
      @pairs = alpha.zip(rotated_characters).to_h
    end
    return @pairs
  end

  def rotate_2(num_2 = 0)
    if num_2 == 0
      rotated_characters = alpha.rotate(@final_key[1])
      @pairs = alpha.zip(rotated_characters).to_h
    else
      rotated_characters = alpha.rotate(num_2)
      @pairs = alpha.zip(rotated_characters).to_h
    end
  end

  def rotate_3(num_3 = 0)
    if num_3 == 0
      rotated_characters = alpha.rotate(@final_key[2])
      @pairs = alpha.zip(rotated_characters).to_h
    else
      rotated_characters = alpha.rotate(num_3)
      @pairs = alpha.zip(rotated_characters).to_h
    end
  end

  def rotate_4(num_4 = 0)
    if num_4 == 0
      rotated_characters = alpha.rotate(@final_key[3])
      @pairs = alpha.zip(rotated_characters).to_h
    else
      rotated_characters = alpha.rotate(num_4)
      @pairs = alpha.zip(rotated_characters).to_h
    end
  end

  def encrypt_at_1(letter)
    @pairs[letter.upcase]
  end

  def encrypt_at_2(letter)
    @pairs[letter.upcase]
  end

  def encrypt_at_3(letter)
    @pairs[letter.upcase]
  end

  def encrypt_at_4(letter)
    @pairs[letter.upcase]
  end

  def print_key
    @first_key
    @final_key = @key.final_key
    return @final_key
  end

end

c = Cipher.new

c.alpha
c.rotate_1
a = c.rotate_1.fetch_values("A")
a[0]
c.encrypt_at_1("A")
c.print_key
