require 'combinatorics/extensions/math'

module Combinatorics
  module Derange
    def cardinality
      Math.subfactorial
    end

    # @note The letter 'D' is the discrete math notation for derangements
    def D
      Math.subfactorial
    end
  end
end
