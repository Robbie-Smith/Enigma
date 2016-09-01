require 'simplecov'         
SimpleCov.start
require './lib/crack'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class CrackTest < Minitest::Test
  def test_does_crack_exist
    c = Crack.new

    assert_instance_of Crack, c
  end

  def test_do_we_have_a_library
    c = Crack.new
    c.alpha

    assert_equal c.alpha[0..59], (' '..'Z').to_a
  end

end
