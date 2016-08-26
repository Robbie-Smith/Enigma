require 'pry'

class KeyGen

  def key_gen
    the_array = [*0..9]
    one_key = the_array.sample(1)
    two_key = the_array.sample(1)
    three_key = the_array.sample(1)
    four_key = the_array.sample(1)
    five_key = the_array.sample(1)
    the_key = [[[one_key]+[two_key]+[three_key]+[four_key]+[five_key]].join.to_i]
  end
  binding.pry



end

enigma = KeyGen.new
binding.pry
