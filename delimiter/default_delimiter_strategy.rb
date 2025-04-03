# frozen_string_literal: true
require_relative 'delimiter_strategy'
module Delimiter
  # Default Delimiter Strategy
  class DefaultDelimiterStrategy < DelimiterStrategy
    def parse(numbers)
      delimiters = [",", "\n"]
      delimiters.each do |delimiter|
        numbers = numbers.gsub(delimiter, ",")
      end
      numbers.split(",")
    end
  end
end