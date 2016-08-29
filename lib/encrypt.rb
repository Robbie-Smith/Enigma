require 'pry'
require_relative 'cipher'

class Encryptor
  def initialize
    @cipher = Cipher.new
    @rotator_1 = @cipher.rotate_1
    @rotator_2 = @cipher.rotate_2
    @rotator_3 = @cipher.rotate_3
    @rotator_4 = @cipher.rotate_4
  end
  # def encrypt_at_a(letter)
  #   @rotator_1.encrypt_at_a
  # end
  def encrypt(word)
    word_split = word.upcase.split('')
    new_word = []
    word_split.each do |i|
      array = []
      array << @rotator_1[i]
      array << @rotator_2[i + i]
      # alpha << @rotator_3[word_split[i + 2]]
      # alpha << @rotator_4[word_split[i + 3]]
        return alpha
    end
  end

  # def encrypt_at_b(letter)
  #   uppercase_letter = letter.upcase
  #   rotate_b[uppercase_letter]
  # end
  #
  # def encrypt_at_c(letter)
  #   uppercase_letter = letter.upcase
  #   rotate_c[uppercase_letter]
  # end
  #
  # def encrypt_at_d(letter)
  #   uppercase_letter = letter.upcase
  #   rotate_d[uppercase_letter]
  # end
end

e = Encryptor.new
# e.rotate_a
e.encrypt("HellomynameisRobbie.")
