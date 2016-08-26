require 'pry'
<<<<<<< HEAD
class Offset
  attr_reader :square
  def initialize
    @square = []
    # @offset = offset
    @time = Time.new
  end

  def squaring_function
    @square
    if @square.empty?
      num = @time.strftime("%d%m%y").to_i
      @square << num ** 2
    end
    return @square
  end

  # def offset
  #   @square = square.to_s
  #   @offset = @square.drop_while {|i| i < 6}
  #   return @offset
  # end
end

o = Offset.new
o.squaring_function
=======
require 'time'

class Offsets



  def todays_date
    time = Time.new.to_a
  end

  def offset_date(index)
    todays_date.fetch(index)
  end

  def offset_joined
     offset_num = [offset_date(4), offset_date(3), offset_date(5)].join
  end

  def offset_squared
    offset_joined.to_i ** 2
  end

  def offset
    squared = offset_squared
    offset_string = squared.to_s.chars
    offset_string.last(4).join.to_i
  end


end

x = Offsets.new
>>>>>>> 96ce318895b41da9b301e9e0bc6b6be84596351a
