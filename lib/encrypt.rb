require_relative 'key_gen'  # => true
require_relative 'offset'   # => true

class Encryptor
  attr_reader :shift            # => nil
  def initialize
    @key = KeyGen.new           # => #<KeyGen:0x007f8bf3828300>
    @offset = Offset.new        # => #<Offset:0x007f8bf3823b48 @square="", @time=2016-08-26 22:06:32 -0600>
    @first_shift = Array.new    # => []
    @offset_holder = Array.new  # => []
    @final_key = Array.new      # => []
  end                           # => :initialize

  def combine
    key_holder = Array.new                                   # => []
    key_holder = @key.key_gen                                # => [5, 8, 0, 0, 3]
    @first_shift = Array.new                                 # => []
    @first_shift << key_holder.join[0] + key_holder.join[1]  # => ["58"]
    @first_shift << key_holder.join[1] + key_holder.join[2]  # => ["58", "80"]
    @first_shift << key_holder.join[2] + key_holder.join[3]  # => ["58", "80", "00"]
    @first_shift << key_holder.join[3] + key_holder.join[4]  # => ["58", "80", "00", "03"]
    @first_shift.map! {|v| v.to_i}                           # => [58, 80, 0, 3]
  end                                                        # => :combine

  def final_key
      @offset.squaring_function                                  # => 68024985856
      @offset_holder = @offset.offset                            # => [5, 8, 5, 6]
      @final_key = @first_shift.map.with_index do |value,index|  # => #<Enumerator: [58, 80, 0, 3]:map>
                value + @offset_holder[index]                    # => 63, 88, 5, 9
    end                                                          # => [63, 88, 5, 9]
    return @final_key                                            # => [63, 88, 5, 9]
  end                                                            # => :final_key
end                                                              # => :final_key

e = Encryptor.new  # => #<Encryptor:0x007f8bf38283a0 @key=#<KeyGen:0x007f8bf3828300>, @offset=#<Offset:0x007f8bf3823b48 @square="", @time=2016-08-26 22:06:32 -0600>, @first_shift=[], @offset_holder=[], @final_key=[]>
e.combine          # => [58, 80, 0, 3]
e.final_key        # => [63, 88, 5, 9]
