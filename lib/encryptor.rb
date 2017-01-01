require 'pry'
require_relative 'rotator'

class Encryptor
  attr_reader :rotator, :key

  def initialize(user_key=nil)
    @rotator = Rotator.new(user_key)
    @rotation = @rotator.rotator
  end

  def encrypt(contents)
    new_word = contents.chars.map.with_index do |letter,index|
      if @rotation[index].nil?
        @rotation[0][letter]
      else
        @rotation[index][letter]
      end
    end.join
    puts "#{@rotator.print_key}"
    puts "#{new_word}"
    new_word
  end
end
