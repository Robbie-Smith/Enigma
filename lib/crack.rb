require 'pry'
require_relative 'encrypt'

class Crack
  attr_reader :library, :alpha, :word

  def initialize
    # @key = FinalKey.new
    # @first_key = @key.combine
    # @final_key = @key.final_key
    @cipher = Cipher.new
    @alpha = @cipher.alpha
  end


  def library
    key = FinalKey.new
    first_key = key.combine
    final_key = key.final_key
    rotated_characters = @alpha.rotate(final_key[0])
    @library_1 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(final_key[1])
    @library_2 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(final_key[2])
    @library_3 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(final_key[3])
    @library_4 = @alpha.zip(rotated_characters).to_h
  end

  def crack(new_word)
    split_word = new_word.split(//)
      library
      split_word.map do |letter|
        counter = 0
        if split_word != "hello"
          counter+=1
          @library_1.key(letter)
        elsif counter == 1
          counter+=1
          @library_2.key(letter)
        elsif counter == 2
          counter+=1
          @library_3.key(letter)
        elsif counter == 3
          counter += 1
          @library_4.key(letter)
        # else
          # crack(new_word)
        end

    split_word
  end
  end
end

c = Crack.new
c.library
c.crack("OZWVV")
