require './lib/enigma'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_call_rotator
    e = Enigma.new
    refute nil, e.rotator.final_key
    assert_equal 4, e.rotator.final_key.length
  end

  def test_can_we_encrypt
    e = Enigma.new
    refute_equal "Hello", e.encrypt("Hello")
  end

  def test_can_we_decrypt
    e = Enigma.new

    assert_equal "End", e.decrypt('T03','15294254')
  end

end
