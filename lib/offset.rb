require 'pry'

class OffsetGenerator

  attr_reader :square
  attr_accessor :time

  def initialize
    @time = Time.new
    squaring_function
  end

  def squaring_function
    date = time.strftime("%d%m%y").to_i
    @square = date ** 2
    offset
  end

  def offset
    squared_time = convert_squared_time_to_string
    offset = squared_time.drop(5)
    offset.map {|num| num.to_i}
  end

  def convert_squared_time_to_string
    square.to_s.chars
  end
end
