require 'pry'
require_relative 'encryptor'

class Decryptor
  attr_reader :library
  def initialize
    @cipher = Cipher.new
    @alpha = @cipher.alpha
  end

  def reset(num_1,num_2,num_3,num_4)
    rotated_characters = @alpha.rotate(num_1)
    @library_1 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(num_2)
    @library_2 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(num_3)
    @library_3 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(num_4)
    @library_4 = @alpha.zip(rotated_characters).to_h
  end

  def decrypt(new_word)
    # binding.pry
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
    # binding.pry
  end
end
# binding.pry
# d = Decrypt.new
# d.reset(72,21,66,51)
# decrypt = d.decrypt("GVUFCZ")
# d.reset(39,30,60,14)
# d.decrypt ("UITZBAWFYH")
