require_relative 'final_key'          # => true
require 'pry'                         # => false
class Rotator
  attr_accessor :set, :a, :b, :c, :d  # => nil

  def initialize
    @set = set                 # => nil
    @final_key = FinalKey.new  # => #<FinalKey:0x007fefca8b01e8 @key=#<KeyGen:0x007fefca8b0148>, @offset=#<Offset:0x007fefca8b0120 @square="", @time=2016-08-27 19:45:52 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>
    @map = ('a'..'z').to_a     # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @crypted_word = Array.new  # => []
  end                          # => :initialize

  def final_key
      @set = @final_key.combine  # => [13, 69, 15, 53]
  end                            # => :final_key

  def rotations
    @a = @set[0]                                                 # => 13
    @b = @set[1]                                                 # => 69
    @c = @set[2]                                                 # => 15
    @d = @set[3]                                                 # => 53
  end                                                            # => :rotations
  def rotator(word)
    letters = ('a'..'z').to_a                                    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    wordsplit = word.split('')                                   # => ["a", "b"]
    wordsplit.length                                             # => 2
    count = 0                                                    # => 0
    while count < wordsplit.length                               # => true
    wordsplit.each do |alpha|                                    # => ["a", "b"]
      if letters.include?(alpha.downcase)                        # => true
        letters.map.with_index do |l, index|                     # => #<Enumerator: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]:map>
        @crypted_word << letters[(index + @a) % letters.length]  # => ["n"], ["n", "o"], ["n", "o", "p"], ["n", "o", "p", "q"], ["n", "o", "p", "q", "r"], ["n", "o", "p", "q", "r", "s"], ["n", "o", "p", "q", "r", "s", "t"], ["n", "o", "p", "q", "r", "s", "t", "u"], ["n", "o", "p", "q", "r", "s", "t", "u", "v"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d"], ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e"], ["n", "o", "p", "q", "r", "s", "t", ...
        # @crypted_word << letters[(index + @b) % 4]
        # @crypted_word << letters[(index + @c) % letters.length]
        # @crypted_word << letters[(index + @d) % letters.length]
        @crypted_word.uniq.first                                 # => "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n"
        end                                                      # => ["n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n", "n"]
        return @crypted_word                                     # => ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
      end
      end
    end
    count += 1
  end                                                            # => :rotator
end                                                              # => :rotator
n = Rotator.new                                                  # => #<Rotator:0x007fefca8b03a0 @set=nil, @final_key=#<FinalKey:0x007fefca8b01e8 @key=#<KeyGen:0x007fefca8b0148>, @offset=#<Offset:0x007fefca8b0120 @square="", @time=2016-08-27 19:45:52 -0600>, @first_key=[], @offset_holder=[], @final_key=[]>, @map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], @crypted_word=[]>
n.final_key                                                      # => [13, 69, 15, 53]
n.rotations                                                      # => 53
n.rotator('ab')                                                  # => ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
