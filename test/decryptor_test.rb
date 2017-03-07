require_relative 'test_helper.rb'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_can_we_decrypt
    # skip
    d = Decryptor.new("15294254")

    assert_equal 'Morning', d.decrypt("b1AIx\"v")
    assert_equal 'End', d.decrypt('T03')
    assert_equal "Hey!**", d.decrypt("W'HW99")
    assert_equal 'Hello, person!', d.decrypt('W\';G#;/$t&\'#"0')
  end

  def test_case_name
    skip
    d = Decryptor.new

    assert_equal 'the end', d.decrypt(encrypted_word,"01020304")
  end
end
