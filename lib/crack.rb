require 'pry'
require_relative 'decryptor'
require_relative 'cipher'
require_relative 'offset'

class Crack
  attr_reader :library, :alpha, :word, :reset_key, :split
  attr_accessor :key

  def initialize
    @cipher = Cipher.new
    @offset = Offset.new
    @offset_holder = Array.new
    @alpha = @cipher.alpha
    @reset_key = reset_key
    @key = key
    @crack = Array.new
  end

  def crack(word)
    @word = word
    99999.times do |key|
      key = key.to_s.rjust(5,'0')
      cracked_message = decrypt(word, key)
      if cracked_message[-3..-1] == "END"
        puts "#{cracked_message} + #{key}"
        return cracked_message
      end
    end
  end

  def split(key)
      @split = key.chars
      @reset_key = Array.new
      @reset_key << split.join[0] + split.join[1]
      @reset_key << split.join[1] + split.join[2]
      @reset_key << split.join[2] + split.join[3]
      @reset_key << split.join[3] + split.join[4]
      @reset_key.map! {|i| i.to_i}
    cracked_key
  end

  def cracked_key
    @offset.squaring_function
    @offset_holder = @offset.offset
    @crack = @reset_key.map.with_index do |value,index|
              value + @offset_holder[index]
            end
    reset
  end

  def reset
    rotated_characters = @alpha.rotate(@crack[0])
    @library_1 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@crack[1])
    @library_2 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@crack[2])
    @library_3 = @alpha.zip(rotated_characters).to_h
    rotated_characters = @alpha.rotate(@crack[3])
    @library_4 = @alpha.zip(rotated_characters).to_h
  end

  def decrypt(new_word, key)
    split(key)
    counter=0
  word = new_word[-3..-1].split(%r{\s*}).map do |letter|
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
