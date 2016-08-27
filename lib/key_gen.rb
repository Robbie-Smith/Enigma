require 'pry'  # => true

class KeyGen
attr_reader :key  # => nil

  def key_gen
    initial_numbers = [*1..5]           # => [1, 2, 3, 4, 5]
    key = initial_numbers.map do |num|  # => [1, 2, 3, 4, 5]
      rand(9)                           # => 8, 0, 2, 3, 5
    end                                 # => [8, 0, 2, 3, 5]
    return key                          # => [8, 0, 2, 3, 5]
  end                                   # => :key_gen
end                                     # => :key_gen

enigma = KeyGen.new  # => #<KeyGen:0x007fc96a99ad78>
enigma.key_gen       # => [8, 0, 2, 3, 5]
