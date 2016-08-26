require 'pry'  # => true

class KeyGen
attr_reader :key                        # => nil
  def key_gen
    initial_numbers = [*1..5]           # => [1, 2, 3, 4, 5]
    key = initial_numbers.map do |num|  # => [1, 2, 3, 4, 5]
      rand(9)                           # => 0, 8, 3, 5, 6
    end                                 # => [0, 8, 3, 5, 6]
    return key                          # => [0, 8, 3, 5, 6]
  end                                   # => :key_gen
end                                     # => :key_gen

enigma = KeyGen.new  # => #<KeyGen:0x007f993b092988>
enigma.key_gen       # => [0, 8, 3, 5, 6]
