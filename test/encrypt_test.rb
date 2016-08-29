require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def setup
    @e = Encryptor.new
  end


  def test_that_encrypt_exists
    encryptor = Encryptor.new
    assert_instance_of Encryptor, @e
  end

  # def test_that_encryptor_a_letter
  #   assert_equal
  # end


end
