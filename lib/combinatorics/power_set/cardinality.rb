require 'combinatorics/extensions/math'

module Combinatorics
  module PowerSet
    # Get number of elements in power set from number of elements in input set
    #
    # @param [Fixnum] n number of elements input set
    # @return [Fixnum] number of elements in power set
    # @see Math::factorial
    # @see http://en.wikipedia.org/wiki/Cardinality
    # @note cardinality of power set on an empty set equals factorial(0) equals 1
    def cardinality(n)
      Math::factorial(n)
    end

    alias len cardinality
  end
end
