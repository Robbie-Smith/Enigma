require 'pry'
require_relative 'cipher'

class Encryptor
  attr_accessor :encrypt, :contents, :offset, :manual_key
  def initialize
    @cipher = Cipher.new

    # @offset = Offset.new                                  
    @alpha = @cipher.alpha
  end


  def contents(file_name)
    fname = file_name
    other = File.open(fname, "r")
    file_name = other.readline
    encrypt(file_name)
  end

  def encrypt(contents)
    counter=0
    new_word = contents.split(%r{\s*}).map do |letter|
      if counter == 0
        counter+=1
        @cipher.rotate_1
        @cipher.encrypt_at_1(letter)
        # binding.pry
      elsif counter == 1
        counter+=1
        @cipher.rotate_2
        @cipher.encrypt_at_2(letter)
      elsif counter == 2
        counter+=1
        @cipher.rotate_3
        @cipher.encrypt_at_3(letter)
      elsif counter == 3
        counter = 0
        @cipher.rotate_4
        @cipher.encrypt_at_4(letter)
      end
    end
    puts "#{@cipher.print_key}"
    puts "#{new_word.join}"
    return new_word
  end
end
# binding.pry
e = Encryptor.new
e.()
e.encrypt("hello")
# e.combine('12345')
# binding.pry
# e.encrypt_manual(1,2,3,4)
# e.contents("text.txt")
# # e.decrypt(a)
# puts "\n#{a}"
# puts "#{e.decrypt(a) }"
