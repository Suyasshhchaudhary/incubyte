require 'minitest/autorun'

# Assuming the add method is in a file named add_number.rb
require_relative 'add_number'

class TestAddNumber < Minitest::Test
  def test_add_with_commas
    assert_equal 6, add('1,2,3')
  end

  def test_add_with_newlines_and_commas
    assert_equal 6, add("1\n2,3")
  end

  def test_add_with_semicolons
    assert_equal 6, add('1;2;3')
  end

  def test_add_with_spaces
    assert_equal 6, add('1 2 3')
  end

  def test_add_with_mixed_separators
    assert_equal 10, add('1,2\n3;4')
  end

  def test_add_with_negative_numbers
    error = assert_raises(StandardError) { add('1,2,-3') }
    assert_equal 'Negative numbers not allowed -3', error.message
  end

  def test_add_with_leading_and_trailing_spaces
    assert_equal 6, add('  1,2,3  ')
  end

  def test_add_with_empty_string
    assert_equal 0, add('')
  end

  def test_add_with_only_separators
    assert_equal 0, add(',,,\n;\n\n;;')
  end

  def test_change_delimiter
    assert_equal 3, add('//;\n1;2')
  end
end
