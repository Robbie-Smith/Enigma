require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'time'

class OffsetsTest < Minitest::Test

  def test_if_returns_position_of_date
    skip
    chk_time = Time.new
    time = Offsets.new
    assert_equal 8, time.todays_date[4]
    assert_equal 27, time.todays_date[3]
    assert_equal 2016, time.todays_date[5]
  end

  def test_if_can_return_date_for_offset
    skip
    time = Offsets.new
    assert_equal 27, time.offset_date(3)
    assert_equal 8, time.offset_date(4)
    assert_equal 2016, time.offset_date(5)
  end

  def test_offset_date_joined
    time = Offsets.new
    assert_equal '82716', time.offset_joined
  end

  def test_offset_date_squared
    skip
    time = Offsets.new
    assert_equal 68260908384256, time.offset_squared
  end

  def test_last_four_for_offset
    skip
    time = Offsets.new
    assert_equal 4256, time.offset
  end
end
