require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/final_key'
require 'pry'

class FinalKeyTest < Minitest::Test

  def test_do_we_a_first_key
    f = FinalKey.new
    assert_equal f.combine, f.first_key
    assert_equal 4, f.first_key.length
    assert_instance_of Array, f.first_key
  end

  def test_do_we_have_a_final_key
    f = FinalKey.new
    f.combine

    assert_instance_of FinalKey, f
    assert_equal 4,f.final_key.length
  end

end
