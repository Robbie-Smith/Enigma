require 'pry'  # => true

class Offset
  attr_reader :square, :offset  # => nil
  def initialize
    @square = ''                # => ""
    @time = Time.new            # => 2016-08-28 10:06:42 -0600
  end                           # => :initialize

  def squaring_function
      date = @time.strftime("%d%m%y").to_i  # => 280816
      @square = date ** 2                   # => 78857625856
    return @square                          # => 78857625856
  end                                       # => :squaring_function

  def offset
    square_string = @square.to_s.chars          # => ["7", "8", "8", "5", "7", "6", "2", "5", "8", "5", "6"]
    square_drop = square_string.drop(7)         # => ["5", "8", "5", "6"]
    @offset = square_drop.map {|num| num.to_i}  # => [5, 8, 5, 6]
    return @offset                              # => [5, 8, 5, 6]
  end                                           # => :offset
end                                             # => :offset

o = Offset.new       # => #<Offset:0x007ff6221b9200 @square="", @time=2016-08-28 10:06:42 -0600>
o.squaring_function  # => 78857625856
o.offset             # => [5, 8, 5, 6]
