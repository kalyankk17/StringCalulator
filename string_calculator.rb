# frozen_string_literal: true
require_relative 'delimiter/delimiter_context'
require_relative 'token_processor'
require_relative 'utils/error_handler'

# String Calculator Class
class StringCalculator
  include Utils::ErrorHandler
  def initialize
    @delimiter = Delimiter::DelimiterContext.new
    @token_processor = TokenProcessor.new
  end

  def add(numbers)
    return 0 if numbers.empty?

    tokens = @delimiter.parse(numbers)
    negatives, valid_numbers = @token_processor.process(tokens)

    validate_negatives(negatives)

    valid_numbers.sum
  end
end