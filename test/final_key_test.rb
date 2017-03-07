require 'minitest/autorun'
require 'minitest/pride'
require './lib/final_key'
require './lib/key_gen'
require './lib/offset'
require 'pry'

class FinalKeyTest < Minitest::Test

  def test_final_key_should_combine_the_key_and_offset
    o = OffsetGenerator.new
    o.time = Time.new(2017,01,01)
    f = FinalKey.new([12, 23, 34, 45], o.offset)

    assert_equal [15, 29, 42, 54], f.key
  end

end
