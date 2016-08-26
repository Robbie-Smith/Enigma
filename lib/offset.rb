require 'pry'
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
