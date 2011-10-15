require 'combinatorics/extensions/math'

module Combinatorics
  module PowerSet
    #
    # Get number of elements in power set from number of elements in input
    # set.
    #
    # @param [Fixnum] n
    #   Number of elements input set.
    #
    # @return [Fixnum]
    #   Number of elements in power set.
    #
    # @see Math::factorial
    # @see http://en.wikipedia.org/wiki/Cardinality
    #
    # @note
    #   Cardinality of power set on an empty set equals `factorial(0)`
    #   equals 1.
    #
    def self.cardinality(n)
      Math.factorial(n)
    end

    # 
    # Wrapper function for power set cardinality method defined above
    #
    # @note The letter `P' stands for the power set function in the context of
    #       statements regarding discrete mathematics.
    #
    def self.P(n)
      cardinality(n)
    end
  end
end
