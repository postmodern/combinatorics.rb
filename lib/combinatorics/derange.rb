require 'combinatorics/choose'
require 'combinatorics/list_comprehension'
require 'combinatorics/extensions/math'

module Combinatorics
  module Derange
    include Choose, Math
    #
    # @param [Array] a Sequence to output derangements for
    #
    # @return [Enumerator] Set of the derangements for input sequence
    #
    # @example Produce the derangements of a three-element Array
    #   derange([1, 2, 3]).to_a
    #   # => [[2, 1, 1], [2, 1, 2], [2, 3, 1], [2, 3, 2], [3, 1, 1], [3, 1, 2],
    #      [3, 3, 1], [3, 3, 2]] 
    #
    # @see http://en.wikipedia.org/wiki/Derangements
    #
    # @see Array#comprehension 
    # 
    def derange(a)
      c = []

      return c if a.size <= 1

      for i in (0..(a.size - 1))
        c << (a - [a[i]])
      end

      # @note return an Enumerator from all combinatorics methods so supported
      # code such as ronin-fuzz won't be generating all combinations at once.
      c.comprehension
    end

    alias cardinality subfactorial
    # @note The letter 'D' is formal discrete math notation for this operation
    alias D subfactorial 
  end
end
