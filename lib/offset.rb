require 'pry'  # => true

class Offset
  attr_reader :square, :date #:offset, :date  # => nil
  def initialize
    @time = Time.new  # => 2016-08-29 11:13:31 -0600
  end                 # => :initialize

  def squaring_function
      @date = @time.strftime("%d%m%y").to_i  # => 290816
      @square = date ** 2                    # => 84573945856
  end                                        # => :squaring_function

  def offset
    square_string = @square.to_s.chars  # => ["8", "4", "5", "7", "3", "9", "4", "5", "8", "5", "6"]
    @offset = square_string.drop(7)     # => ["5", "8", "5", "6"]
    @offset.map! {|num| num.to_i}       # => [5, 8, 5, 6]
  end                                   # => :offset
end                                     # => :offset

o = Offset.new       # => #<Offset:0x007ffe82884d60 @time=2016-08-29 11:13:31 -0600>
o.squaring_function  # => 84573945856
o.offset             # => [5, 8, 5, 6]
