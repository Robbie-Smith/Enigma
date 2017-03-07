require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test
  def setup
    user_key = [1,2,3,4,5]
    @encryptor = Encryptor.new(user_key)
  end

  def test_can_we_encrypt
    assert_equal "Igopt", @encryptor.encrypt('Hello')
  end

  def test_encrypt_is_not_case_sensitive
    assert_equal 'iGoPt', @encryptor.encrypt('hElLo')
  end

  def test_encrypt_can_handle_special_characters
    assert_equal "Ig!%", @encryptor.encrypt('Hey!')
  end

  def test_encrypt_can_handle_numbers
    assert_equal "J)p$71!zfbst!pme/", @encryptor.encrypt("I'm 20 years old.")
  end

  def test_encrypt
    skip
    assert_equal "('=?", @encryptor.encrypt("tend")
  end
end
