require_relative 'key_gen'  # => true
require_relative 'offset'   # => true

class Encryptor
  attr_reader :shift            # => nil
  def initialize
    @key = KeyGen.new           # => #<KeyGen:0x007f87e0a7b088>
    @offset = Offset.new        # => #<Offset:0x007f87e0a7ae30 @square="", @time=2016-08-26 22:09:55 -0600>
    @first_shift = Array.new    # => []
    @offset_holder = Array.new  # => []
    @final_key = Array.new      # => []
  end                           # => :initialize

  def combine
    key_holder = Array.new                                   # => []
    key_holder = @key.key_gen                                # => [6, 6, 5, 3, 4]
    @first_shift = Array.new                                 # => []
    @first_shift << key_holder.join[0] + key_holder.join[1]  # => ["66"]
    @first_shift << key_holder.join[1] + key_holder.join[2]  # => ["66", "65"]
    @first_shift << key_holder.join[2] + key_holder.join[3]  # => ["66", "65", "53"]
    @first_shift << key_holder.join[3] + key_holder.join[4]  # => ["66", "65", "53", "34"]
    @first_shift.map! {|v| v.to_i}                           # => [66, 65, 53, 34]
  end                                                        # => :combine

  def final_key
      @offset.squaring_function                                  # => 68024985856
      @offset_holder = @offset.offset                            # => [5, 8, 5, 6]
      @final_key = @first_shift.map.with_index do |value,index|  # => #<Enumerator: [66, 65, 53, 34]:map>
                value + @offset_holder[index]                    # => 71, 73, 58, 40
              end                                                # => [71, 73, 58, 40]
    return @final_key                                            # => [71, 73, 58, 40]
  end                                                            # => :final_key
end                                                              # => :final_key

e = Encryptor.new  # => #<Encryptor:0x007f87e0a7b0b0 @key=#<KeyGen:0x007f87e0a7b088>, @offset=#<Offset:0x007f87e0a7ae30 @square="", @time=2016-08-26 22:09:55 -0600>, @first_shift=[], @offset_holder=[], @final_key=[]>
e.combine          # => [66, 65, 53, 34]
e.final_key        # => [71, 73, 58, 40]
