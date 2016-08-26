require 'pry'          # => true
class Offset
  attr_reader :square  # => nil
  def initialize
    @square = ""       # => ""
    @time = Time.new   # => 2016-08-26 17:29:47 -0600
  end                  # => :initialize

  def squaring_function
    @square                                 # => ""
    if @square.empty?                       # => true
      date = @time.strftime("%d%m%y").to_i  # => 260816
      @square = date ** 2                   # => 68024985856
    end                                     # => 68024985856
    return @square                          # => 68024985856
  end                                       # => :squaring_function

  def offset
    square_string = @square.to_s.chars          # => ["6", "8", "0", "2", "4", "9", "8", "5", "8", "5", "6"]
    square_drop = square_string.drop(7)         # => ["5", "8", "5", "6"]
    @offset = square_drop.map {|num| num.to_i}  # => [5, 8, 5, 6]
    @offset                                      # => [5, 8, 5, 6]
  end                                           # => :offset
end                                             # => :offset

o = Offset.new       # => #<Offset:0x007ffb3c104480 @square="", @time=2016-08-26 17:29:47 -0600>
o.squaring_function  # => 68024985856
o.offset             # => [5, 8, 5, 6]


# =======
# require 'time'
#
# class Offsets
#
#
#
#   def todays_date
#     time = Time.new.to_a
#   end
#
#   def offset_date(index)
#     todays_date.fetch(index)
#   end
#
#   def offset_joined
#      offset_num = [offset_date(4), offset_date(3), offset_date(5)].join
#   end
#
#   def offset_squared
#     offset_joined.to_i ** 2
#   end
#
#   def offset
#     squared = offset_squared
#     offset_string = squared.to_s.chars
#     offset_string.last(4).join.to_i
#   end
#
#
# end
#
# x = Offsets.new
