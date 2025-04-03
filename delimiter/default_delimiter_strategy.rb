# frozen_string_literal: true
require_relative 'delimiter_strategy'
module Delimiter
  # Default Delimiter Strategy
  class DefaultDelimiterStrategy < DelimiterStrategy

    DEFAULT_DELIMITERS = %W[, \n].freeze

    def parse(numbers)
      delimiters = DEFAULT_DELIMITERS
      delimiters.each do |delimiter|
        numbers = numbers.gsub(delimiter, ",")
      end
      numbers.split(",")
    end
  end
end