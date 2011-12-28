def expected(expected, actual)
  "expected #{expected}, got '#{actual}'"
end

def match(x, y)
  x == y
end

def is_alpha(c)
  ('a'..'z').include? c.downcase
end

def is_digit(c)
  ('0'..'9').include? c
end

def get_num(c)
  return c if is_digit c
  raise ArgumentError, expected('integer', c)
end

def emit(s) 
  puts "\t#{s}"
end

def expression c
  emit "MOVE #{get_num c},D0"
end

#main 

puts "enter symbol, 'q' to quit"
print '> '
while (c = gets.chomp()) != 'q' do
  expression c
  print '> '
end

=begin
require 'test/unit'

class CradleTest < Test::Unit::TestCase
  def test_get_num
    assert_block do
      ('0'..'9').all? { |c| (get_num c) == c }
    end

    assert_raise ArgumentError do
      get_num 'a'
    end
  end

  def test_is_alpha
    assert_block do
      ('a'..'z').all? { |c| is_alpha c }
      ('A'..'Z').all? { |c| is_alpha c }
      ('1'..'9').none? { |c| is_alpha c }
      ('!@#$%^&*()_+-=').none? { |c| is_alpha c }
    end
  end

  def test_is_digit
    assert_block do
      ('0'..'9').all? { |c| is_digit c }
      ('a'..'z').none? { |c| is_digit c }
      ('A'..'Z').none? { |c| is_digit c }
    end
  end
end
=end
