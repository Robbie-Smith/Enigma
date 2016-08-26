require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'

class KeyGenTest < Minitest::Test

  def test_generate_an_array_of_numbers
    enigma = KeyGen.new
    enigma.key_gen
    assert_instance_of Array, enigma.key_gen
  end

  def test_length_of_array
    enigma = KeyGen.new
    enigma.key_gen

    assert_equal 5, enigma.key_gen.length
  end

  def test_random
    skip
    enigma = KeyGen.new
    enigma.key_gen

    assert_instance_of Random, enigma.key_gen
  end

end
