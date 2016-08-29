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
    new_word.join
    # decrypt(new_word)                                 # => "HELLO"
  end

  def hash_1
    @cipher.rotate_1
  end

  def decrypt(new_word)
    counter=0
    word = new_word.split(%r{\s*}).map do |letter|
      if counter == 0
        counter+=1
        @cipher.rotate_1.key(letter)
      elsif counter == 1
        counter+=1
        @cipher.rotate_2.key(letter)
      elsif counter == 2
        counter+=1
        @cipher.rotate_3.key(letter)
      elsif counter == 3
        counter = 0
        @cipher.rotate_4.key(letter)
      end
    end
    word.join
  end

end

e = Encryptor.new
a = e.encrypt("Hello")
e.decrypt(a)
