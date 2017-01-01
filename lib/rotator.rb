require 'pry'
require_relative 'final_key'

class Rotator
  attr_reader :final_key, :pairs, :alpha

  def initialize(key = nil)
    @final_key = key || FinalKey.new.key
    @alpha = [*' '..'Z',*'a'..'z']
  end

  def rotator
    final_key.map do |number|
      rotated_alphabet_map(number)
    end
  end

  def rotated_alphabet_map(number)
    rotated_characters = alpha.rotate(number)
    alpha.zip(rotated_characters).to_h
  end

  def print_key
    puts "#{@final_key}"
    return @final_key
  end

end
