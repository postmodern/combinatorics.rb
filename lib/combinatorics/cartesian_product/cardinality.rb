module Combinatorics
  module CartesianProduct
    # Compute the number of elements a Cartesian Product will contain
    #
    # @param [Fixnum] c1 cardinality of first set
    # @param [Fixnum] c2 cardinality of second set
    # @raise [RangeError] c1 must be greater than zero
    # @raise [RangeError] c2 must be greater than zero 
    # @return [Fixnum] number of elements in resulting Cartesian product set
    # @example Combinatorics::CartesianProduct::cardinality(3, 4) => 12
    def cardinality(c1, c2)
      raise(RangeError, 'c1 must be greater than zero') if c1 <= 0
      raise(RangeError, 'c2 must be greater than zero') if c2 <= 0

      c1 * c2
    end

    alias len cardinality
  end
end
