require 'pry'

class KeyGen
attr_reader :key
  def key_gen
    initial_numbers = [*1..5]
    key = initial_numbers.map do |num|
      rand(9)
    end
    return key
  end
end

enigma = KeyGen.new 
enigma.key_gen
