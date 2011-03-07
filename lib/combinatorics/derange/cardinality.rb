require 'combinatorics/extensions/math'

module Combinatorics
  module Derange
    include Math

    alias cardinality subfactorial
    # @note The letter 'D' is the discrete math notation for derangements
    alias D subfactorial 
  end
end
