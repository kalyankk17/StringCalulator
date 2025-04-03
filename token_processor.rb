# frozen_string_literal: true

# Token Processor Class
class TokenProcessor

  MAX_CAPPING = 1000

  def process(tokens)
    negatives = []
    valid_numbers = []

    tokens.each do |token|
      next if token.strip.empty?

      num = token.to_i
      if num.negative?
        negatives << num
      elsif num <= MAX_CAPPING
        valid_numbers << num
      end
    end

    [negatives, valid_numbers]
  end
end
