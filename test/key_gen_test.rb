require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test

  def test_generate_an_array_of_numbers
    k = KeyGen.new
    assert_instance_of Array, k.key_gen
  end

  def test_length_of_array
    k = KeyGen.new
    assert_equal 5, k.key_gen.length
  end

  def test_random
    k = KeyGen.new

    refute_equal [1,2,3,4,5] , k.key_gen
  end

end
