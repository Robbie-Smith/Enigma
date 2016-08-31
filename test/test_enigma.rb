require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end
  
  def test_instance_of_enigma
    assert_instance_of Enigma, @enigma
  end

  def test_instance_of_encryptor
    assert_instance_of Encryptor, @enigma.encrypt
  end

  def test_instance_of_decryptor
    assert_instance_of Decryptor, @enigma.decrypt
  end



end
