require 'pry'
require './lib/cipher'

class Encryptor
  def initialize(string)
    @cipher ||= Cipher.new
  end

  def encrypt(string)
    p @cipher.key
    p @cipher.offset
    p @cipher.a_value[0] % 26
    p @cipher.b_value[0] % 26
    p @cipher.c_value[0] % 26
    p @cipher.d_value[0] % 26
    counter=0
    string.split(%r{\s*}).map do |letter|
      if counter==0
        counter+=1
        @cipher.encrypt_at_a(letter)
      elsif counter == 1
        counter+=1
        @cipher.encrypt_at_b(letter)
      elsif counter ==2
        counter+=1
        @cipher.encrypt_at_c(letter)
      elsif counter==3
        counter = 0
        @cipher.encrypt_at_d(letter)
      end
    end
  end

end

@e = Encryptor.new("a")

binding.pry
