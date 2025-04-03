# frozen_string_literal: true
require_relative 'delimiter/delimiter_context'

# String Calculator Class
class StringCalculator
  def initialize
    @delimiter = Delimiter::DelimiterContext.new
  end

  def add(numbers)
    return 0 if numbers.empty?

    tokens = @delimiter.parse(numbers)
    result = 0
    negatives = []

    tokens.each do |token|
      next if token.strip.empty?

      num = token.to_i
      if num < 0
        negatives << num
      elsif num <= 1000
        result += num
      end
    end

    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    result
  end
end