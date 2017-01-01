require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotator'

class RotateTest < Minitest::Test
  def test_does_rotator_work_correctly
    user_key = [1,2,3,4,5]
    c = Rotator.new(user_key)

    assert_equal "B", c.rotator[0]["A"]
    assert_equal "C", c.rotator[1]["A"]
    assert_equal "D", c.rotator[2]["A"]
    assert_equal "E", c.rotator[3]["A"]
  end

  def test_the_key_should_be_printed
    c = Rotator.new([1,2,3,4,5])

    assert_equal c.final_key, c.print_key
  end

end
