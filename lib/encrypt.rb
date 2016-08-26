require 'pry'
require './lib/key_gen'
require './lib/offset'

class Encryptor

  def cipher(key, offset)
    rotation = key + offset
    characters = ('A'..'Z').to_a
    rotated_characters = characters.rotate(rotation)
    pairs = characters.zip(rotated_characters)
    hash_pair = Hash[pairs]
  end
binding.pry
  def encrypt_letter(letter, key, offset)
    uppercase_letter = letter.upcase
    cipher(key, offset)[uppercase_letter]
  end


end

@encryptor = Encryptor.new

binding.pry
