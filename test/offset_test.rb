require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require "pry"
class OffsetTest < Minitest::Test

  def test_do_we_have_the_time
    n = Offset.new
    n.squaring_function

    assert_equal n.date, Math.sqrt(n.square).to_i
  end
  def test_does_time_square
    n = Offset.new

    assert_equal n.squaring_function, n.square
  end

  def test_offset
    n = Offset.new
    n.squaring_function

    assert_instance_of Array, n.offset
    assert_equal 6, n.offset.length
  end

end
