require 'pry'
require_relative 'encryptor'

class Decryptor
  attr_reader :library, :reset_key
  attr_accessor :word
  def initialize
    @cipher = Cipher.new
    @alpha = @cipher.alpha
  end

  def split(key)
      split = key.chars
      @reset_key = Array.new
      @reset_key << split.join[0] + split.join[1]
      @reset_key << split.join[2] + split.join[3]
      @reset_key << split.join[4] + split.join[5]
      @reset_key << split.join[6] + split.join[7]
      @reset_key.map! {|i| i.to_i}
    reset
  end

  def reset
    rotated_characters = @alpha.rotate(@reset_key[0])
    @library_1 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@reset_key[1])
    @library_2 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@reset_key[2])
    @library_3 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@reset_key[3])
    @library_4 = @alpha.zip(rotated_characters).to_h
  end

  def decrypt(new_word, key)
    split(key)
    counter=0
  word = new_word.split(%r{\s*}).map! do |letter|
      if counter == 0
        counter+=1
        @library_1.key(letter)
      elsif counter == 1
        counter+=1
        @library_2.key(letter)
      elsif counter == 2
        counter+=1
        @library_3.key(letter)
      elsif counter == 3
        counter = 0
        @library_4.key(letter)
      end
    end
    puts "#{word.join}"
    return word.join
  end
end
