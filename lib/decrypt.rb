require 'pry'               # => true
require_relative 'encrypt'  # => true

class Decrypt
  def initialize
    @encrypt = Encryptor.new  # => #<Encryptor:0x007ff7e58d2450 @cipher=#<Cipher:0x007ff7e58d2428 @offset=#<Offset:0x007ff7e58d2400 @time=2016-08-29 15:35:45 -0600>, @key=#<FinalKey:0x007ff7e58d2388 @key=#<KeyGen:0x007ff7e58d2360>, @offset=#<Offset:0x007ff7e58d2338 @time=2016-08-29 15:35:45 -0600>, @first_key=[72, 37, 12, 53], @offset_holder=[], @final_key=[]>, @final_key=[72, 37, 12, 53]>>
  end                         # => :initialize

  def test
    @encrypt.encrypt("hello")  # => "BPXMI"
  end                          # => :test

end  # => :test

d = Decrypt.new  # => #<Decrypt:0x007ff7e58d2478 @encrypt=#<Encryptor:0x007ff7e58d2450 @cipher=#<Cipher:0x007ff7e58d2428 @offset=#<Offset:0x007ff7e58d2400 @time=2016-08-29 15:35:45 -0600>, @key=#<FinalKey:0x007ff7e58d2388 @key=#<KeyGen:0x007ff7e58d2360>, @offset=#<Offset:0x007ff7e58d2338 @time=2016-08-29 15:35:45 -0600>, @first_key=[72, 37, 12, 53], @offset_holder=[], @final_key=[]>, @final_key=[72, 37, 12, 53]>>>
d.test           # => "BPXMI"
