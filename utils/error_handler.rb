# frozen_string_literal: true
module Utils
  # Class to handle calculator Errors
  module ErrorHandler
    def validate_negatives(negatives)
      return if negatives.empty?

      raise "Negatives not allowed: #{negatives.join(', ')}"
    end
  end
end
