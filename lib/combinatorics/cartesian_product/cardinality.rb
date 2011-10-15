module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module CartesianProduct
    #
    # Wrapper for Cartesian product cardinality method defined above
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
    def self.cardinality(a,b)
      if (a <= 0 || b <= 0)
        raise(RangeError,"inputs must be greater than zero")
      end

      a * b
    end

    #
    # @note The letter `X' is scholastic notation for the Cartesian product
    #       set operation
    #
    # @see cardinality
    #
    def self.X(a,b)
      cardinality(a,b)
    end
  end
end
