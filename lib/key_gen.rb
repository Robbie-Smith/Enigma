require 'pry'  # => true

class KeyGen
attr_reader :key  # => nil

  def key_gen
    key = [*1..5]      # => [1, 2, 3, 4, 5]
    key.map! do |num|  # => [1, 2, 3, 4, 5]
      rand(9)          # => 6, 1, 7, 3, 0
    end                # => [6, 1, 7, 3, 0]
    return key         # => [6, 1, 7, 3, 0]
  end                  # => :key_gen
end                    # => :key_gen

enigma = KeyGen.new  # => #<KeyGen:0x007ff4738a3828>
enigma.key_gen       # => [6, 1, 7, 3, 0]
