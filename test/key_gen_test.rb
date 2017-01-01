
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test

  def test_key_should_be_an_array
    k = KeyGen.new

    assert_instance_of Array, k.generate_random_key
  end

  def test_length_of_array
    k = KeyGen.new
    assert_equal 5, k.generate_random_key.length
  end

  def test_key_should_contain_the_numbers_one_through_five
    k = KeyGen.new

    k.generate_random_key.each do |num|
      assert_includes [*"0".."9"], num
    end
  end

  def test_format_key
    user_key = "12345"
    k = KeyGen.new(user_key)

    assert_equal [12, 23, 34, 45], k.key
  end
end
