require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require "pry"

class OffsetTest < Minitest::Test

  def test_time_should_return_last_four_digits_of_time_squared
    o = OffsetGenerator.new
    o.time = Time.new(2017,01,01)
 
    assert_equal [3, 6, 8, 9], o.offset
  end

end
