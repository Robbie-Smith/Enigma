require 'pry'
require_relative 'encrypt'

class Decrypt
  def initialize
    @encrypt = Encryptor.new
  end

  def test
    @encrypt.encrypt("hello")
  end

end

d = Decrypt.new
d.test
