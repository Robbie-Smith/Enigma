require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require "pry"
class OffsetTest < Minitest::Test

  def test_does_time_square
    n = Offset.new
    @time = Time.new
    @date = @time.strftime("%d%m%y").to_i
    @square = @date ** 2
    assert_equal @square, n.squaring_function
  end

  def test_offset
    n = Offset.new
    square_string = @square.to_s.chars
    @offset = square_string.drop(7)
    @offset.map! {|num| num.to_i}
    assert_instance_of Array, n.offset
    assert_equal 4, @offset.length
    assert_equal @offset, n.offset
  end

end
