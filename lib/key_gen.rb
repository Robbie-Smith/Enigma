require 'pry'     # => true
require 'matrix'  # => true
class KeyGen
attr_reader :key  # => nil

  def key_gen
    initial_numbers = [*1..5]           # => [1, 2, 3, 4, 5]
    key = initial_numbers.map do |num|  # => [1, 2, 3, 4, 5]
      rand(9)                           # => 5, 8, 5, 0, 1
    end                                 # => [5, 8, 5, 0, 1]
    return key                          # => [5, 8, 5, 0, 1]
  end                                   # => :key_gen
end                                     # => :key_gen

enigma = KeyGen.new  # => #<KeyGen:0x007ff309840e00>
enigma.key_gen       # => [5, 8, 5, 0, 1]
