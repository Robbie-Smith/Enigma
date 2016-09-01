require 'pry'
require_relative 'cipher'

class Encryptor

  def initialize
    @cipher = Cipher.new
    @alpha = @cipher.alpha
  end

  def encrypt(contents)
    counter=0
    new_word = contents.split(%r{\s*}).map do |letter|
      if counter == 0
        counter+=1
        @cipher.rotate_1
        @cipher.encrypt_at_1(letter)
      elsif counter == 1
        counter+=1
        @cipher.rotate_2
        @cipher.encrypt_at_2(letter)
      elsif counter == 2
        counter+=1
        @cipher.rotate_3
        @cipher.encrypt_at_3(letter)
      elsif counter == 3
        counter = 0
        @cipher.rotate_4
        @cipher.encrypt_at_4(letter)
      end
    end
    puts "#{@cipher.print_key}"
    puts "#{new_word.join}"
    new_word.join
  end
end
