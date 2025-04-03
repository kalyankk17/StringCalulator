# frozen_string_literal: true
require_relative 'delimiter_strategy'
require_relative 'custom_delimiter_strategy'
require_relative 'default_delimiter_strategy'

module Delimiter
  # Composite Strategy to Combine Default and Custom Strategies
  class CompositeDelimiterStrategy < DelimiterStrategy
    def initialize
      super
      @strategies = [CustomDelimiterStrategy.new, DefaultDelimiterStrategy.new]
    end

    def parse(numbers)
      @strategies.each do |strategy|
        result = strategy.parse(numbers)
        return result unless result.nil?
      end
      []
    end
  end
end

