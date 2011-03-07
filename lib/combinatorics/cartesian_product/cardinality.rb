# @author duper <super@manson.vistech.net>

module Combinatorics
  module CartesianProduct
    #
    # Compute the number of elements a Cartesian Product will contain
    #
    # @param [Fixnum] a Cardinality of first set
    #
    # @param [Fixnum] b Cardinality of second set
    #
    # @raise [RangeError] Inputs must be greater than zero 
    #
    # @return [Fixnum] Length of enumeration resulting from a Cartesian product
    #
    # @example Calculate elements in Cartesian product of two equal-size sets
    #   cardinality(3, 4) 
    #   # => 12
    # 
    def cardinality(a, b)
      raise(RangeError, 'inputs must be greater than zero') if a <= 0 or b <= 0

      a * b
    end

    alias len cardinality
  end
end
