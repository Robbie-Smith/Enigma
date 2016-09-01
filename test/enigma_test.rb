require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_instance_of_enigma
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_instance_of_encryptor
    e = Enigma.new
    assert_instance_of Encryptor, e.encrypt_word
  end

  def test_instance_of_decryptor
    e = Enigma.new
    assert_instance_of Decryptor, e.decrypt_word
  end

  def test_instance_of_cipher
    e = Enigma.new
    assert_instance_of Cipher, e.cipher
  end

  def test_call_cipher
    e = Enigma.new
    refute nil, e.cipher.final_key
    assert_equal 4, e.cipher.final_key.length
  end

  def test_can_we_encrypt
    e = Enigma.new
    refute_equal "Hello", e.encrypt("Hello")
  end

  def test_can_encrypt_use_a_manual_key
    skip
    e = Enigma.new
  end

  def test_can_we_decrypt
    e = Enigma.new

    assert_equal "END", e.decrypt('LPD','07282671')
  end

end
