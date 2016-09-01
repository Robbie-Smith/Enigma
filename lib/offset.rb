require 'pry'

class Offset
  attr_reader :square, :date
  def initialize
    @time = Time.new
    @square = square
    @date = date
  end

  def squaring_function
      @date = @time.strftime("%d%m%y").to_i
      @square = date ** 2
      return @square
  end

  def offset
    square_string = @square.to_s.chars
    @offset = square_string.drop(5)
    @offset.map! {|num| num.to_i}
  end
end
