require 'pry'              # => true
require_relative 'cipher'  # => true

class Encryptor
  def initialize
    @cipher = Cipher.new  # => #<Cipher:0x007fb74d20acb8 @offset=#<Offset:0x007fb74d20ac90 @time=2016-08-29 16:15:52 -0600>, @key=#<FinalKey:0x007fb74d20ac40 @key=#<KeyGen:0x007fb74d20ac18>, @offset=#<Offset:0x007fb74d20abc8 @time=2016-08-29 16:15:52 -0600>, @first_key=[33, 73, 18, 46], @offset_holder=[], @final_key=[]>, @final_key=[33, 73, 18, 46]>

  end  # => :initialize

  def encrypt(string)
    counter=0                                         # => 0
    new_word = string.split(%r{\s*}).map do |letter|  # => ["H", "e", "l", "l", "o"]
      if counter == 0                                 # => true, false, false, false, true
        counter+=1                                    # => 1, 1
        @cipher.encrypt_at_1(letter)                  # => "O", "V"
      elsif counter == 1                              # => true, false, false
        counter+=1                                    # => 2
        @cipher.encrypt_at_2(letter)                  # => "Z"
      elsif counter == 2                              # => true, false
        counter+=1                                    # => 3
        @cipher.encrypt_at_3(letter)                  # => "D"
      elsif counter == 3                              # => true
        counter = 0                                   # => 0
        @cipher.encrypt_at_4(letter)                  # => "F"
      end                                             # => "O", "Z", "D", "F", "V"
    end                                               # => ["O", "Z", "D", "F", "V"]
    new_word.join                                     # => "OZDFV"
    # decrypt(new_word)                                 # => "HELLO"
  end                                                 # => :encrypt

  def hash_1
    @cipher.rotate_1
  end                 # => :hash_1

  def decrypt(new_word)
    counter=0                                       # => 0
    word = new_word.split(%r{\s*}).map do |letter|  # => ["O", "Z", "D", "F", "V"]
      if counter == 0                               # => true, false, false, false, true
        counter+=1                                  # => 1, 1
        @cipher.rotate_1.key(letter)                # => "H", "O"
      elsif counter == 1                            # => true, false, false
        counter+=1                                  # => 2
        @cipher.rotate_2.key(letter)                # => "E"
      elsif counter == 2                            # => true, false
        counter+=1                                  # => 3
        @cipher.rotate_3.key(letter)                # => "L"
      elsif counter == 3                            # => true
        counter = 0                                 # => 0
        @cipher.rotate_4.key(letter)                # => "L"
      end                                           # => "H", "E", "L", "L", "O"
    end                                             # => ["H", "E", "L", "L", "O"]
    word.join                                       # => "HELLO"
  end                                               # => :decrypt

end  # => :decrypt

e = Encryptor.new       # => #<Encryptor:0x007fb74d20ad08 @cipher=#<Cipher:0x007fb74d20acb8 @offset=#<Offset:0x007fb74d20ac90 @time=2016-08-29 16:15:52 -0600>, @key=#<FinalKey:0x007fb74d20ac40 @key=#<KeyGen:0x007fb74d20ac18>, @offset=#<Offset:0x007fb74d20abc8 @time=2016-08-29 16:15:52 -0600>, @first_key=[33, 73, 18, 46], @offset_holder=[], @final_key=[]>, @final_key=[33, 73, 18, 46]>>
a = e.encrypt("Hello")  # => "OZDFV"
e.decrypt(a)            # => "HELLO"
