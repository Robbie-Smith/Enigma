require 'pry'
class Offset
  attr_reader :square
  def initialize
    @square = ''
    @time = Time.new
  end

  def squaring_function
    if @square.nil? == false
      date = @time.strftime("%d%m%y").to_i
      @square = date ** 2
    end
    return
  end

  def offset
    square_string = @square.to_s.chars
    square_drop = square_string.drop(7)
    @offset = square_drop.map {|num| num.to_i}
    return
  end
end

o = Offset.new
o.squaring_function
o.offset
