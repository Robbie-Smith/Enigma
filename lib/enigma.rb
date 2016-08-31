require_relative 'encryptor'
require_relative 'decryptor'

class Enigma
  attr_reader :encrypt, :decrypt

  def initialize
    @encrypt = Encryptor.new
    @decrypt = Decryptor.new
  end
end
