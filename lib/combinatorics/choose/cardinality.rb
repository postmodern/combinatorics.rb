
require 'combinatorics/extensions/math'

module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module Choose
    include Math
    #
    # @param [Fixnum] n
    #   The number of elements in the input set
    #
    # @param [Fixnum] r
    #   Cardinality of subsets to choose
    #
    # @raise [RangeError]
    #   `n` must be non-negative.
    #
    # @raise [RangeError]
    #   `r` must be non-negative.
    #
    # @raise [RangeError]
    #   `r` must be less than or equal to `n`.
    #
    # @return [Fixnum]
    #   The binomial coefficient for "n-choose-r"
    #
    # @example
    #   C(6, 4)
    #
    # @see http://en.wikipedia.org/wiki/Binomial_coefficient
    #
    # @note
    #   This method's naming convention reflects well-known notation used 
    #   within fields of academic inquiry such as discrete mathematics and
    #   set theory. It represents a function returning an integer value
    #   for the cardinality of a k-combination (i.e. binomial coefficient.)
    #
    def C(n, r = nil)
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n
        return 1 if n.zero? or n == r

        (n ** r) / factorial(r)
      end
    end

    alias cardinality C
    alias len cardinality

    #
    # @param [Fixnum] c
    #   Input set cardinality.
    #
    # @return [Array]
    #   Elements are cardinalities for each subset "1" through "c".
    #
    # @raise [RangeError]
    #   `c` must be non-negative.
    #
    # @example
    #   cardinality_all(4)
    #
    # @note
    #   Sum of elements will equal factorial(c).
    #
    # @see Combinatorics::Choose::Mixin::cardinality_all
    # @see http://en.wikipedia.org/wiki/Combinations
    # 
    def cardinality_all(c)
      if c.zero?
        return []
      elsif c < 0
        raise(RangeError, 'c must be non-negative') if c < 0
      end

      ret = [c]

      2.upto(c) { |x| ret << C(c, x) }

      ret
    end

    alias C_all cardinality_all
    alias len_all C_all
  end
end
