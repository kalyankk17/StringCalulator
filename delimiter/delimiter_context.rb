# frozen_string_literal: true
require_relative 'default_delimiter_strategy'
require_relative 'custom_delimiter_strategy'
module Delimiter
  # Context Class to Choose the Appropriate Strategy
  class DelimiterContext
    def initialize
      @default_strategy = DefaultDelimiterStrategy.new
      @custom_strategy = CustomDelimiterStrategy.new
    end

    def parse(numbers)
      if numbers.start_with?("//")
        @custom_strategy.parse(numbers)
      else
        @default_strategy.parse(numbers)
      end
    end
  end
end
