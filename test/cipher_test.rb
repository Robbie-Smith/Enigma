require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cipher'

class CipherTest < Minitest::Test
  attr_reader :cipher, :offset, :keygen

  def setup
    @cipher = Cipher.new
    @offset = Offset.new
    @keygen = Keygen.new
  end

  def test_if_exists
    assert_instance_of Keygen, @keygen
    assert_instance_of Offset, @offset
    assert_instance_of Cipher, @cipher
  end

  def test_if_alphabet_exist
    assert_equal ('A'..'Z').to_a, @cipher.alpha
  end

  def test_passes_key
    skip
    assert_equal Array, cipher.keygen.class
  end

  def test_passes_offset
    assert_equal Array, cipher.offset.class
  end

  def test_cipher_a_values

    assert_equal [@cipher.key[0, 2].join.to_i + @cipher.offset[0].to_i], cipher.a_value
  end

  def test_cipher_b_values

    assert_equal [@cipher.key[1, 2].join.to_i + @cipher.offset[1].to_i], cipher.b_value
  end

  def test_cipher_c_values

    assert_equal [@cipher.key[2, 2].join.to_i + @cipher.offset[2].to_i], cipher.c_value
  end

  def test_cipher_d_values

    assert_equal [@cipher.key[3, 2].join.to_i + @cipher.offset[3].to_i], cipher.d_value
  end

  def test_can_a_val_rotate

    assert_equal Hash, @cipher.rotate_a.class
  end

  def test_can_encrypt_a
    # Testing at rotate_a is the position in the Hash.
    assert_equal @cipher.rotate_a['A'], @cipher.encrypt_at_a('A')
  end


end
