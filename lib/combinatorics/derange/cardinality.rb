require 'combinatorics/extensions/math'

module Combinatorics
  module Derange
    #
    # Compute the number of derangements for a data structure of given size
    #
    # @see Math.subfactorial
    #
    # @note The letter "D" denotes derangement cardinality in discrete math
    # 
    def cardinality
      Math.subfactorial
    end

    # Alias for shortened derangement cardinality method name
    alias len cardinality

    #
    # Wrapper for derangement cardinality method defined above
    #
    # @note The letter `D' is academic representation for derangements
    #
    def Derange.D
      cardinality
    end
  end
end
