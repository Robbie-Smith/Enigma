require './lib/crack'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class CrackTest < Minitest::Test
  def setup
    user_key = [12, 23, 34, 45]
    encryptor = Encryptor.new(user_key)

    @encrypted_word = encryptor.encrypt("the...end...")
  end
  def test_can_it_crack
    c = Crack.new

    #key = [15, 29, 42, 5]
    assert_equal 'the end', c.crack(@encrypted_word)
  end

end
