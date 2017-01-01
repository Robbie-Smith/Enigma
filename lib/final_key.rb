require_relative 'key_gen'
require_relative 'offset'
require 'pry'

class FinalKey
  attr_reader :first_key,
              :key,
              :offset

  def initialize(first_key = nil,offset = nil)
    @first_key = first_key || KeyGen.new.key
    @offset = offset || OffsetGenerator.new.offset
    combine
  end

  def combine
    @key = first_key.map.with_index do |num, index|
      num + offset[index]
    end
  end
end
