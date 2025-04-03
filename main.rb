require_relative 'string_calculator'

calculator = StringCalculator.new

# Basic cases
puts calculator.add("") # Output: 0
puts calculator.add("1") # Output: 1
puts calculator.add("1,2") # Output: 3

# Unknown amount of numbers
puts calculator.add("1,2,3,4,5") # Output: 15

# Newline as delimiter
puts calculator.add("1\n2,3") # Output: 6

# Custom delimiter
puts calculator.add("//;\n1;2") # Output: 3

# Numbers greater than 1000
puts calculator.add("2,1001") # Output: 2

# Long custom delimiter
puts calculator.add("//[***]\n1***2***3") # Output: 6

# Multiple custom delimiters
puts calculator.add("//[*][%]\n1*2%3") # Output: 6

# Multiple long custom delimiters
puts calculator.add("//[***][%%%]\n1***2%%%3") # Output: 6

# Negative numbers
begin
  puts calculator.add("1,-2,3,-4")
rescue => e
  puts e.message # Output: Negatives not allowed: -2, -4
end