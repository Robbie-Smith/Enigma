require 'pry'  # => true

class Offset
  attr_reader :square  # => nil
  def initialize
    @square = ''       # => ""
    @time = Time.new   # => 2016-08-26 22:08:39 -0600
  end                  # => :initialize

  def squaring_function
    if @square.nil? == false                # => true
      date = @time.strftime("%d%m%y").to_i  # => 260816
      @square = date ** 2                   # => 68024985856
    end                                     # => 68024985856
    return @square                          # => 68024985856
  end                                       # => :squaring_function

  def offset
    square_string = @square.to_s.chars          # => ["6", "8", "0", "2", "4", "9", "8", "5", "8", "5", "6"]
    square_drop = square_string.drop(7)         # => ["5", "8", "5", "6"]
    @offset = square_drop.map {|num| num.to_i}  # => [5, 8, 5, 6]
    return @offset                              # => [5, 8, 5, 6]
  end                                           # => :offset
end                                             # => :offset

o = Offset.new       # => #<Offset:0x007fe58981af58 @square="", @time=2016-08-26 22:08:39 -0600>
o.squaring_function  # => 68024985856
o.offset             # => [5, 8, 5, 6]
