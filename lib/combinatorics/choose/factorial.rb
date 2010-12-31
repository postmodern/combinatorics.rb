module Combinatorics
  module Choose
    #
    # Calculates the factorial of a number.
    #
    # @param [Integer] n
    #   The number to calculate the factorial of.
    #
    # @return [Integer]
    #   The factorial of `n`.
    #
    # @example
    #   factorial
    #   # => 1
    #
    # @example
    #   factorial(10)
    #   # => 3628800
    #
    # @since 0.4.0
    #
    def factorial(n=1)
      count, product = 0, 1

      n.times do
        count += 1
        product *= count
      end

      product
    end
  end
end
