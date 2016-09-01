require_relative 'key_gen'  # => true
require_relative 'offset'   # => true
require 'pry'               # => false

class FinalKey
  attr_reader :crypted_word, :letters, :first_key, :final_key  # => nil
  def initialize
    @key = KeyGen.new                                          # => #<KeyGen:0x007f8088a614f8>
    @offset = Offset.new                                       # => #<Offset:0x007f8088a612f0 @time=2016-09-01 00:23:51 -0600, @square=nil, @date=nil>
    @first_key = Array.new                                     # => []
    @offset_holder = Array.new                                 # => []
    @final_key = Array.new                                     # => []
  end                                                          # => :initialize

  def combine
    @first_key << @key.key_gen.join[0] + @key.key_gen.join[1]  # => ["24"]
    @first_key << @key.key_gen.join[1] + @key.key_gen.join[2]  # => ["24", "83"]
    @first_key << @key.key_gen.join[2] + @key.key_gen.join[3]  # => ["24", "83", "36"]
    @first_key << @key.key_gen.join[3] + @key.key_gen.join[4]  # => ["24", "83", "36", "71"]
    @first_key.map! {|num| num.to_i}                           # => [24, 83, 36, 71]
    return @first_key                                          # => [24, 83, 36, 71]
  end                                                          # => :combine

  def final_key
    @offset.squaring_function                                # => 119159056
    @offset_holder = @offset.offset                          # => [5, 6]
    @final_key = @first_key.map.with_index do |value,index|  # => #<Enumerator: [24, 83, 36, 71]:map>
              value + @offset_holder[index]                  # ~> TypeError: nil can't be coerced into Fixnum
            end
    return @final_key
  end                                                        # => :final_key
end                                                          # => :final_key
f = FinalKey.new                                             # => #<FinalKey:0x007f8088a61520 @key=#<KeyGen:0x007f8088a614f8>, @offset=#<Offset:0x007f8088a612f0 @time=2016-09-01 00:23:51 -0600, @square=nil, @date=nil>, @first_key=[], @offset_holder=[], @final_key=[]>
f.combine                                                    # => [24, 83, 36, 71]
f.final_key

# ~> TypeError
# ~> nil can't be coerced into Fixnum
# ~>
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:28:in `+'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:28:in `block in final_key'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `map'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `with_index'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:27:in `final_key'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/final_key.rb:35:in `<main>'
