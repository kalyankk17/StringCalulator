module Delimiter
  # Base Strategy Interface
  class DelimiterStrategy
    def parse(numbers)
      raise NotImplementedError, "Subclasses must implement the `parse` method"
    end
  end
end
