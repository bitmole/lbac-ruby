module Cradle
  TAB = "\t"
  attr_accessor :look

  def get_char
    @look = STDIN.getc
  end

  def error(msg)
    puts "Error: #{msg}."
  end

  def abort(with_msg)
    error with_msg
    Process.exit
  end

  def expected(s)
    abort "expected '#{s}'"
  end

  def match(c)
    if @look == c[0]
      get_char
    else 
      expected c
    end
  end

  def Cradle.is_alpha(c)
    return ('a'..'z').include? c.downcase
  end

  def Cradle.is_digit(c)
    return ('0'..'9').include? c
  end

  def get_num()
    return 7
  end
end

require 'test/unit'

class CradleTest < Test::Unit::TestCase
  def test_is_alpha
    assert_block do
      ('a'..'z').all? { |c| Cradle.is_alpha c }
      ('A'..'Z').all? { |c| Cradle.is_alpha c }
      ('1'..'9').none? { |c| Cradle.is_alpha c }
      ('!@#$%^&*()_+-=').none? { |c| Cradle.is_alpha c }
    end
  end

  def test_is_digit
    assert_block do
      ('0'..'9').all? { |c| Cradle.is_digit c }
      ('a'..'z').none? { |c| Cradle.is_digit c }
      ('A'..'Z').none? { |c| Cradle.is_digit c }
    end
  end
end
