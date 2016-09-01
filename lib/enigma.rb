require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'
require 'pry'
class Enigma
  attr_reader :encrypt_word, :decrypt_word, :cipher

  def initialize
    @encrypt_word = Encryptor.new
    @decrypt_word = Decryptor.new
    @crack = Crack.new
    @cipher = Cipher.new
  end

  def encrypt(word_or_file)
    @encrypt_word.encrypt(word_or_file)
    puts "#{@encrypt_word} is encrypted with the key #{@cipher.print_key}"
  end

  def decrypt(word_or_file, key)
    @decrypt_word.decrypt(word_or_file.upcase, key)
  end

  def crack(word_or_file)
    @crack.crack(word_or_file)
  end
end
# e = Enigma.new
# e.encrypt('END')
