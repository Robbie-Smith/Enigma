require 'pry'

class KeyGen

  attr_reader :key

  def initialize(user_key=nil)
    @user_key = user_key
    @key = key
    key_gen
  end

  def key_gen
    if @user_key.nil?
      @key = format_key(generate_random_key)
    else
      converted_key = convert_key_to_string
      @key = format_key(converted_key)
    end
  end

  def convert_key_to_string
    @user_key.chars.map {|num| num.to_s}
  end

  def generate_random_key
    [*1..5].map do |num|
      rand(9).to_s
    end
  end

  def format_key(key)
    key.each_cons(2).map do|num|
      num.join.to_i
    end
  end
end
