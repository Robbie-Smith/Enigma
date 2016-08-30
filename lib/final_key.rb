require_relative 'key_gen'             # => true
require_relative 'offset'              # => true
require 'pry'                          # => false
class FinalKey
  attr_reader :crypted_word, :letters  # => nil
  def initialize
    @key = KeyGen.new                  # => #<KeyGen:0x007f970b0f6348>
    @offset = Offset.new               # => #<Offset:0x007f970b0f5fb0 @time=2016-08-29 17:11:43 -0600>
    @first_key = Array.new             # => []
    @offset_holder = Array.new         # => []
    @final_key = Array.new             # => []
  end                                  # => :initialize

  def combine
    @first_key << @key.key_gen.join[0] + @key.key_gen.join[1]  # => ["23"]
    @first_key << @key.key_gen.join[1] + @key.key_gen.join[2]  # => ["23", "66"]
    @first_key << @key.key_gen.join[2] + @key.key_gen.join[3]  # => ["23", "66", "47"]
    @first_key << @key.key_gen.join[3] + @key.key_gen.join[4]  # => ["23", "66", "47", "06"]
    @first_key.map! {|num| num.to_i}                           # => [23, 66, 47, 6]
  end                                                          # => :combine

  def final_key
    @offset.squaring_function                                # => 84573945856
    @offset_holder = @offset.offset                          # => [5, 8, 5, 6]
    @final_key = @first_key.map.with_index do |value,index|  # => #<Enumerator: [23, 66, 47, 6]:map>
              value + @offset_holder[index]                  # => 28, 74, 52, 12
            end                                              # => [28, 74, 52, 12]
    return @final_key                                        # => [28, 74, 52, 12]
  end                                                        # => :final_key
end                                                          # => :final_key
n = FinalKey.new                                             # => #<FinalKey:0x007f970b0f6370 @key=#<KeyGen:0x007f970b0f6348>, @offset=#<Offset:0x007f970b0f5fb0 @time=2016-08-29 17:11:43 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
n.combine                                                    # => [23, 66, 47, 6]
n.final_key                                                  # => [28, 74, 52, 12]
