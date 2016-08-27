require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
# require 'time'

class OffsetTest < Minitest::Test
  def test_does_time_square
  n = Offset.new
  n.squaring_function

  assert_equal @square, n.squaring_function
  end

  def test_offset
    n = Offset.new
    n.squaring_function
    n.offset

    assert_equal @offset, n.offset

  end

end
