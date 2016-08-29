require 'pry'
require 'time'

class Offset
  attr_reader :time

  def intialize
    @time = Time.new
  end


  def todays_date
    time = Time.new
  end

  def offset_date
    todays_date.strftime("%m%d%y")
  end

  def offset_split
    offset_date.split(%r{\s*})
  end

  def offset_joined
     offset_num = offset_split.join
  end

  def offset_squared
    offset_joined.to_i ** 2
  end

  def offset
    # squared = offset_squared
    offset_string = offset_squared.to_s.chars
    offset_string.last(4)
  end



end

@offset = Offset.new
# binding.pry
