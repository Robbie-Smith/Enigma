require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class RotateTest < Minitest::Test
  def test_do_we_have_a_library
    c = Cipher.new
    assert_instance_of Array, c.alpha
    assert_equal 26, c.alpha.length
    assert_equal c.alpha, c.characters
  end

  def test_does_rotate_1_manually_rotate_correctly
    c = Cipher.new
    c.rotate_1(1)

    assert_equal "B", c.encrypt_at_1("A")
    c.rotate_1(25)

    assert_equal "Z", c.encrypt_at_1("A")
    c.rotate_1(27)

    assert_equal "B", c.encrypt_at_1("A")
  end

  def test_does_rotate_2_manually_rotate_correctly
    c = Cipher.new
    c.rotate_2(1)
    assert_equal "B", c.encrypt_at_2("A")
    c.rotate_2(25)

    assert_equal "Z", c.encrypt_at_2("A")
    c.rotate_2(27)

    assert_equal "B", c.encrypt_at_2("A")
  end

  def test_does_rotate_3_manually_rotate_correctly
    c = Cipher.new
    c.rotate_3(1)
    assert_equal "B", c.encrypt_at_3("A")
    c.rotate_3(25)

    assert_equal "Z", c.encrypt_at_3("A")
    c.rotate_3(27)

    assert_equal "B", c.encrypt_at_3("A")
  end

  def test_does_rotate_4_manually_rotate_correctly
    c = Cipher.new
    c.rotate_4(1)
    assert_equal "B", c.encrypt_at_4("A")
    c.rotate_4(25)

    assert_equal "Z", c.encrypt_at_4("A")
    c.rotate_4(27)

    assert_equal "B", c.encrypt_at_4("A")
  end

  def test_does_rotate_1_randomnly_rotate_correctly
    c = Cipher.new
    letter = c.rotate_1.fetch_values("A")
    assert_equal letter[0], c.encrypt_at_1("A")
  end

  def test_does_rotate_2_randomnly_rotate_correctly
    c = Cipher.new
    letter = c.rotate_2.fetch_values("A")
    assert_equal letter[0], c.encrypt_at_2("A")
  end

  def test_does_rotate_3_randomnly_rotate_correctly
    c = Cipher.new
    letter = c.rotate_3.fetch_values("A")
    assert_equal letter[0], c.encrypt_at_3("A")
  end

  def test_does_rotate_4_randomnly_rotate_correctly
    c = Cipher.new
    letter = c.rotate_4.fetch_values("A")
    assert_equal letter[0], c.encrypt_at_4("A")
  end

  def test_can_we_print_the_key
    c = Cipher.new

    assert_equal c.final_key, c.print_key
  end

end
