require 'pry'
require_relative 'decryptor'

class Crack

  attr_reader :decryptor

  def initialize
    @decryptor = Decryptor.new
  end

  def crack(word)
    99999.times do |key|
      decryptor = Decryptor.new(convert_key_to_string(key))
      cracked_message = decryptor.decrypt(word)
      if cracked_message[-7..-1].eql?("...end...")
        puts "#{cracked_message} + #{key}"
        return cracked_message
      end
    end
  end

  def convert_key_to_string(key)
    key.to_s.rjust(5,'0')
  end

end
