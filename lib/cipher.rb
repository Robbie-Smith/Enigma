require 'pry'
require_relative 'final_key'

class Cipher
  attr_reader :offset, :keygen, :key, :final_key, :characters, :pairs


  def initialize
    @key = FinalKey.new
    @combine = @key.combine
    @final_key = @key.final_key
    @user_key = KeyGen.new
    @pairs = pairs
  end

  def alpha
    @characters = (' '..'Z').to_a
  end

  def rotate_1
      rotated_characters = alpha.rotate(@final_key[0])
      @pairs = alpha.zip(rotated_characters).to_h
  end

  def rotate_2
      rotated_characters = alpha.rotate(@final_key[1])
      @pairs = alpha.zip(rotated_characters).to_h
  end

  def rotate_3
      rotated_characters = alpha.rotate(@final_key[2])
      @pairs = alpha.zip(rotated_characters).to_h
  end

  def rotate_4
      rotated_characters = alpha.rotate(@final_key[3])
      @pairs = alpha.zip(rotated_characters).to_h
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
    puts "#{@final_key}"
    return @final_key
  end

end
