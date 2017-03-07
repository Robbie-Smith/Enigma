require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'
require 'pry'
class Enigma
  attr_reader :encrypt_word, :decrypt_word, :rotator

  def initialize
    @encrypt_word = Encryptor.new
    @rotator = Rotator.new
  end

  def encrypt(word_or_file)
    @encrypt_word.encrypt(word_or_file)
    puts "#{@encrypt_word} is encrypted with the key #{rotator.print_key}"
  end

  def decrypt(word_or_file, key)
    decryptor = Decryptor.new(key)
    decryptor.decrypt(word_or_file)
  end

  def crack(word_or_file)
    Crack.new.crack(word_or_file)
  end
end
