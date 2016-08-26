require 'pry'
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
