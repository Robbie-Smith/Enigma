require 'pry'

class KeyGen
attr_reader :key

  def key_gen
    key = [*1..5]
    key.map! do |num|
      rand(9)
    end
    return key
  end
end

enigma = KeyGen.new
enigma.key_gen
