# frozen_string_literal: true
require_relative 'delimiter_strategy'

module Delimiter
  # Custom Delimiter Strategy
  # Custom Delimiter Strategy with Stack
  class CustomDelimiterStrategy < DelimiterStrategy
    def parse(numbers)
      # Extract the delimiter section and numbers section
      delimiter_section, numbers_section = extract_delimiters_and_numbers(numbers)

      # Parse delimiters and push them onto a stack
      stack = parse_delimiters_to_stack(delimiter_section)

      # Add default delimiters (`,` and `\n`) to the stack
      stack.push(",", "\n")

      # Split the numbers using the stack of delimiters
      split_numbers_with_stack(numbers_section, stack)
    end

    private

    # Extract the delimiter section and the numbers section
    def extract_delimiters_and_numbers(numbers)
      delimiter_end_index = numbers.index("\n")
      delimiter_section = numbers[2...delimiter_end_index] # Skip the `//` prefix
      numbers_section = numbers[(delimiter_end_index + 1)..] # Numbers after the newline
      [delimiter_section, numbers_section]
    end

    # Parse the delimiters and push them onto a stack
    def parse_delimiters_to_stack(delimiter_section)
      stack = []
      if delimiter_section.start_with?("[") && delimiter_section.end_with?("]")
        # Multiple delimiters enclosed in square brackets
        current_delimiter = ""
        inside_brackets = false

        delimiter_section.each_char do |char|
          if char == "["
            inside_brackets = true
            current_delimiter = ""
          elsif char == "]"
            inside_brackets = false
            stack.push(current_delimiter)
          elsif inside_brackets
            current_delimiter += char
          end
        end
      else
        # Single-character delimiter
        stack.push(delimiter_section)
      end
      stack
    end

    # Split the numbers using the stack of delimiters
    def split_numbers_with_stack(numbers_section, stack)
      tokens = [numbers_section]

      # Iteratively split the numbers using each delimiter in the stack
      until stack.empty?
        delimiter = stack.pop
        tokens = tokens.flat_map { |token| token.split(delimiter) }
      end

      tokens
    end
  end
end
