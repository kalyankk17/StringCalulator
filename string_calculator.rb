# frozen_string_literal: true
require_relative 'delimiter/delimiter_context'
require_relative 'token_processor'

# String Calculator Class
class StringCalculator
  def initialize
    @delimiter = Delimiter::DelimiterContext.new
    @token_processor = TokenProcessor.new
  end

  def add(numbers)
    return 0 if numbers.empty?

    tokens = @delimiter.parse(numbers)
    negatives, valid_numbers = @token_processor.process(tokens)

    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    valid_numbers.sum
  end
end