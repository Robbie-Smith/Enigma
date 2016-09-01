require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test
  def test_does_decryptor_exist
    d = Decryptor.new

    assert_instance_of Decryptor, d
  end

  def test_can_we_decrypt
    d = Decryptor.new

    assert_equal 'MORNING', d.decrypt(',X(6(WX', '26091794')
    assert_equal 'END', d.decrypt('-*4', '35824344')
    assert_equal "HEY!**", d.decrypt('X#L7:C', '16254681')
    assert_equal 'HELLO,PERSON', d.decrypt('Y+/0%M3)(922', '17923090')
    assert_equal 'E', d.decrypt('Q', '71581852')

  end
end
