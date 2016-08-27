require_relative 'key_gen'
require_relative 'offset'
require 'matrix'

class Encryptor
  attr_reader :shift
  def initialize
    @key = KeyGen.new
    @offset = Offset.new
    @first_shift = Array.new
    @offset_holder = Array.new
    @final_key = Array.new
  end

  def shift
    key_holder = Array.new
    key_holder = @key.key_gen
    @first_shift = Array.new
    @first_shift << key_holder.join[0] + key_holder.join[1]
    @first_shift << key_holder.join[1] + key_holder.join[2]
    @first_shift << key_holder.join[2] + key_holder.join[3]
    @first_shift << key_holder.join[3] + key_holder.join[4]
    @first_shift.map! {|v| v.to_i}
    @offset.squaring_function
    @offset_holder = @offset.offset
  end

  def add_shift
      @final_key = @first_shift.map.with_index do |value,index|
                value + @offset_holder[index]
    end
    return @final_key
  end
end

e = Encryptor.new
e.shift
e.add_shift
