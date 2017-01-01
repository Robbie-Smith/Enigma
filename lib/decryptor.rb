require 'pry'
require_relative 'encryptor'

class Decryptor
attr_reader :rotator

  def initialize(key=nil)
    @key = format_reset_key(key.to_s)

    @rotator = Rotator.new(@key)
    @alpha = @rotator.alpha
  end

  def format_reset_key(key)
    k = key.chars.each_cons(2).map do |num|
      num.join.to_i
    end

  end

  def decrypt(encrypted_contents)
    word = encrypted_contents.chars.map.with_index do |letter,index|
      select_letter(letter,index)
    end.join
    puts "#{word} key: #{@key} "
    return word
  end

  def select_letter(letter,index)
    if @rotator.rotator[index].nil?
      @rotator.rotator[0].key(letter)
    else
      @rotator.rotator[index].key(letter)
    end
  end
end
