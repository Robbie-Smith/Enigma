require_relative 'key_gen'             # => true
require_relative 'offset'              # => true
require 'pry'                          # => false
class FinalKey
  attr_reader :crypted_word, :letters  # => nil
  def initialize
    @key = KeyGen.new                  # => #<KeyGen:0x007fc53b92e2c8>
    @offset = Offset.new               # => #<Offset:0x007fc53b92dee0 @square="", @time=2016-08-27 20:40:11 -0600>
    @first_key = Array.new             # => []
    @offset_holder = Array.new         # => []
    @final_key = Array.new             # => []
  end                                  # => :initialize

  def combine
    @key.key_gen                                               # => [4, 7, 3, 0, 4]
    @first_key << @key.key_gen.join[0] + @key.key_gen.join[1]  # => ["03"]
    @first_key << @key.key_gen.join[1] + @key.key_gen.join[2]  # => ["03", "01"]
    @first_key << @key.key_gen.join[2] + @key.key_gen.join[3]  # => ["03", "01", "63"]
    @first_key << @key.key_gen.join[3] + @key.key_gen.join[4]  # => ["03", "01", "63", "31"]
    @first_key.map! {|num| num.to_i}                           # => [3, 1, 63, 31]
    final_key                                                  # => [8, 9, 68, 37]
  end                                                          # => :combine

  def final_key
    @offset.squaring_function                                # => 73341305856
    @offset_holder = @offset.offset                          # => [5, 8, 5, 6]
    @final_key = @first_key.map.with_index do |value,index|  # => #<Enumerator: [3, 1, 63, 31]:map>
              value + @offset_holder[index]                  # => 8, 9, 68, 37
            end                                              # => [8, 9, 68, 37]
    return @final_key                                        # => [8, 9, 68, 37]
  end                                                        # => :final_key
end                                                          # => :final_key
n = FinalKey.new                                             # => #<FinalKey:0x007fc53b92e2f0 @key=#<KeyGen:0x007fc53b92e2c8>, @offset=#<Offset:0x007fc53b92dee0 @square="", @time=2016-08-27 20:40:11 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
n.combine                                                    # => [8, 9, 68, 37]
