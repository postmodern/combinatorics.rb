# frozen_string_literal: true

require_relative '../extensions/math'

module Combinatorics
  module Derange
    #
    # Compute the number of derangements for a data structure of given size
    #
    # @see Math.subfactorial
    #
    def self.cardinality(n)
      Math.subfactorial(n)
    end

    #
    # Wrapper for derangement cardinality method defined above
    #
    # @note The letter `D' is academic representation for derangements
    #
    def self.D(n)
      cardinality(n)
    end
  end
end
