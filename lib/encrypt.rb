require_relative 'key_gen'  # => true
require_relative 'offset'   # => true
require 'matrix'            # => false

class Encryptor
  attr_reader :shift            # => nil
  def initialize
    @key = KeyGen.new           # => #<KeyGen:0x007fb462828070>
    @offset = Offset.new        # => #<Offset:0x007fb462823a70 @square="", @time=2016-08-26 20:17:32 -0600>
    @first_shift = Array.new    # => []
    @offset_holder = Array.new  # => []
  end                           # => :initialize

  def shift
    key_holder = Array.new                                        # => []
    key_holder = @key.key_gen                                     # => [6, 1, 2, 7, 6]
    @first_shift = Array.new                                      # => []
    @first_shift << key_holder.join[0] + key_holder.join[1]       # => ["61"]
    @first_shift << key_holder.join[1] + key_holder.join[2]       # => ["61", "12"]
    @first_shift << key_holder.join[2] + key_holder.join[3]       # => ["61", "12", "27"]
    @first_shift << key_holder.join[3] + key_holder.join[4]       # => ["61", "12", "27", "76"]
    @first_shift << key_holder.join[0] + key_holder.join[1]       # => ["61", "12", "27", "76", "61"]
    @first_shift.map {|v| v.to_i}                                 # => [61, 12, 27, 76, 61]
    @offset.squaring_function                                     # => 68024985856
    @offset_holder = @offset.offset                               # => [5, 8, 5, 6]
  end                                                             # => :shift

  def add_shift
    final = Array.new
    @first_shift.zip(@offset_holder).each {|i| i.first + i.last}  # ~> TypeError: no implicit conversion of Fixnum into String



  end  # => :add_shift
end    # => :add_shift

e = Encryptor.new  # => #<Encryptor:0x007fb462828110 @key=#<KeyGen:0x007fb462828070>, @offset=#<Offset:0x007fb462823a70 @square="", @time=2016-08-26 20:17:32 -0600>, @first_shift=[], @offset_holder=[]>
e.shift
e.add_shift

# ~> TypeError
# ~> no implicit conversion of Fixnum into String
# ~>
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/encrypt.rb:26:in `+'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/encrypt.rb:26:in `block in shift'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/encrypt.rb:26:in `each'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/encrypt.rb:26:in `shift'
# ~> /Users/robertsmith/Turing/1module/Enigma/lib/encrypt.rb:38:in `<main>'
