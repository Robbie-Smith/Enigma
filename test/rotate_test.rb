require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class RotateTest < Minitest::Test
  def test_do_we_have_a_library
    c = Cipher.new
    c.alpha

    assert_instance_of Array, c.alpha
    assert_equal 26, c.alpha.length
    assert_same ('A'..'Z').to_a, c.alpha
  end

end
