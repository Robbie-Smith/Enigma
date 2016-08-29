require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/key_gen'     # ~> LoadError: cannot load such file -- ./lib/key_gen

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

# ~> LoadError
# ~> cannot load such file -- ./lib/key_gen
# ~>
# ~> /usr/local/Cellar/ruby/2.3.1/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /usr/local/Cellar/ruby/2.3.1/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/robertsmith/Turing/1module/Enigma/test/key_gen_test.rb:3:in `<main>'
