require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test
  def test_does_encryptor_exist
    e = Encryptor.new

    assert_instance_of Encryptor, e
  end

  def test_can_we_encrypt
    e = Encryptor.new

    refute_equal 'Hello', e.encrypt('Hello')
    refute_equal 'Gfjjp', e.encrypt('Hello')
    refute_equal 'sjdfh', e.encrypt('Hello')
  end
end
