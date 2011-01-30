require 'combinatorics/choose'
require 'combinatorics/list_comprehension'
require 'combinatorics/extensions/math'

module Combinatorics
  module Derange
    include Choose, Math

    # @param [Array] a sequence to output derangements for
    # @return [Enumerator] set of the derangements for input sequence
    # @example derange([1, 2, 3])
    # @see http://en.wikipedia.org/wiki/Derangements
    # @see Array#comprehension 
    def derange(a)
      c = []

      return c if a.size <= 1

      for i in 0 .. a.size - 1
        c << a - [a[i]]
      end

      # @note return an Enumerator from all combinatorics methods so supported
      # code such as ronin-fuzz won't be generating all combinations at once.
      c.comprehension
    end

    alias cardinality subfactorial
    alias D subfactorial # discrete math notation
  end
end
