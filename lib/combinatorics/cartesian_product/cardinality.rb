module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module CartesianProduct
    #
    # Compute the number of elements a Cartesian Product will contain.
    #
    # @param [Fixnum] a
    #   Cardinality of first set.
    #
    # @param [Fixnum] b
    #   Cardinality of second set.
    #
    # @raise [RangeError]
    #   Inputs must be greater than zero.
    #
    # @return [Fixnum]
    #   Length of enumeration resulting from a Cartesian product.
    #
    # @example Calculate elements in Cartesian product of two equal-size sets
    #   cardinality(3, 4) 
    #   # => 12
    # 
    def cardinality(a, b)
      if a <= 0 or b <= 0
        raise(RangeError, 'inputs must be greater than zero')
      end

      a * b
    end

    alias len cardinality

    #
    # Wrapper for Cartesian product cardinality method defined above
    #
    # @note The letter `X' is scholastic notation for the Cartesian product
    #       set operation
    #
    # @see CartesianProduct.cardinality
    #
    def CartesianProduct.X
      cardinality
    end
  end
end
