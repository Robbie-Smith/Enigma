require_relative 'key_gen'             # => true
require_relative 'offset'              # => true
require 'pry'                          # => false
class FinalKey
  attr_reader :crypted_word, :letters  # => nil
  def initialize
    @key = KeyGen.new                  # => #<KeyGen:0x007ffdbd19a4e8>
    @offset = Offset.new               # => #<Offset:0x007ffdbd19a150 @time=2016-08-29 15:34:35 -0600>
    @first_key = Array.new             # => []
    @offset_holder = Array.new         # => []
    @final_key = Array.new             # => []
  end                                  # => :initialize

  def combine
    @first_key << @key.key_gen.join[0] + @key.key_gen.join[1]  # => ["18"]
    @first_key << @key.key_gen.join[1] + @key.key_gen.join[2]  # => ["18", "80"]
    @first_key << @key.key_gen.join[2] + @key.key_gen.join[3]  # => ["18", "80", "62"]
    @first_key << @key.key_gen.join[3] + @key.key_gen.join[4]  # => ["18", "80", "62", "82"]
    @first_key.map! {|num| num.to_i}                           # => [18, 80, 62, 82]
  end                                                          # => :combine

  def final_key
    @offset.squaring_function                                # => 84573945856
    @offset_holder = @offset.offset                          # => [5, 8, 5, 6]
    @final_key = @first_key.map.with_index do |value,index|  # => #<Enumerator: [18, 80, 62, 82]:map>
              value + @offset_holder[index]                  # => 23, 88, 67, 88
            end                                              # => [23, 88, 67, 88]
    return @final_key                                        # => [23, 88, 67, 88]
  end                                                        # => :final_key
end                                                          # => :final_key
n = FinalKey.new                                             # => #<FinalKey:0x007ffdbd19a510 @key=#<KeyGen:0x007ffdbd19a4e8>, @offset=#<Offset:0x007ffdbd19a150 @time=2016-08-29 15:34:35 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
n.combine                                                    # => [18, 80, 62, 82]
n.final_key                                                  # => [23, 88, 67, 88]
