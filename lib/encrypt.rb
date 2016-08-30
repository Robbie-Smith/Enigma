require 'pry'
require_relative 'cipher'

class Encryptor
  def initialize
    @cipher = Cipher.new
  end

  def encrypt(string)
    counter=0
    new_word = string.split(%r{\s*}).map do |letter|
      if counter == 0
        counter+=1
        @cipher.encrypt_at_1(letter)
      elsif counter == 1
        counter+=1
        @cipher.encrypt_at_2(letter)
      elsif counter == 2
        counter+=1
        @cipher.encrypt_at_3(letter)
      elsif counter == 3
        counter = 0
        @cipher.encrypt_at_4(letter)
      end
    end
    puts "#{@cipher.print_key}"
    puts "#{new_word.join}"
  end
end

# e = Encryptor.new
# a = e.encrypt("Maggie")
# # e.decrypt(a)
# puts "\n#{a}"
# puts "#{e.decrypt(a) }"
