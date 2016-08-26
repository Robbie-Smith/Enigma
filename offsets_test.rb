require 'minitest/autorun'
require 'minitest/pride'
require './lib/offsets'
require 'time'

class OffsetsTest < Minitest::Test

  def test_if_returns_position_of_date
    time = Offsets.new
    assert_equal 8, time.todays_date[4]
    assert_equal 26, time.todays_date[3]
    assert_equal 2016, time.todays_date[5]
  end

  def test_if_can_return_date_for_offset
    time = Offsets.new
    assert_equal 26, time.offset_date(3)
    assert_equal 8, time.offset_date(4)
    assert_equal 2016, time.offset_date(5)
  end

  def test_offset_date_joined
    time = Offsets.new
    assert_equal '8262016', time.offset_joined
  end

  def test_offset_date_squared
    time = Offsets.new
    assert_equal 68260908384256, time.offset_squared
  end

  def test_last_four_for_offset
    time = Offsets.new
    assert_equal 4256, time.offset
  end
end
