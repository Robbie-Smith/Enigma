require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test

  def test_can_find_number_in_array
    skip
    #test to check for number in 0-9 array
    enigma = KeyGen.new
    assert enigma.key_gen.include?(5)
  end

  def test_can_pull_number_out_of_array
    skip
    #test to check if can pull out number into array
    enigma = KeyGen.new
    assert_equal [*0..9], enigma.key_gen
  end

  def test_can_join_two_digit_array
    skip
    #test if we can join two numbers in an array
    enigma = KeyGen.new
    assert_equal [*0..9], enigma.key_gen
  end

  def test_if_can_join_arrays
    #test if we can join the_key
    enigma = KeyGen.new
    assert_equal [*0..9], enigma.key_gen
  end

end
