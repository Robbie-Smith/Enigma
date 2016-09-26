require_relative 'key_gen'
require_relative 'offset'
require 'pry'

class FinalKey
  attr_reader :first_key

  def initialize
    @key = KeyGen.new
    @offset = Offset.new
    @first_key = Array.new
    @offset_holder = Array.new
    combine
  end

  def combine

    @first_key << @key.key_gen.join[0] + @key.key_gen.join[1]
    @first_key << @key.key_gen.join[1] + @key.key_gen.join[2]
    @first_key << @key.key_gen.join[2] + @key.key_gen.join[3]
    @first_key << @key.key_gen.join[3] + @key.key_gen.join[4]
    @first_key.map! {|num| num.to_i}
    # return @first_key
  end

  def final_key
    @offset.squaring_function
    @offset_holder = @offset.offset
    @final_key = @first_key.map.with_index do |value,index|
              value + @offset_holder[index]
            end
    return @final_key
  end
end
