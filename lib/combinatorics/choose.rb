# @author duper <super@manson.vistech.net>

require 'combinatorics/extensions/math'

module Combinatorics
  module Choose
    include Math

    # @param [Fixnum] n the number of elements in the input set
    # @param [Fixnum] r cardinality of subsets to choose
    # @raise [RangeError] n must be non-negative
    # @raise [RangeError] r must be non-negative
    # @raise [RangeError] r must be less than or equal to n
    # @return [Fixnum] the binomial coefficient of "n-choose-r"
    # @example C(6, 4)
    # @see http://en.wikipedia.org/wiki/Binomial_coefficient
    # @note This method's naming convention reflects well-known notation used 
    #       within fields of academic inquiry such as discrete mathematics and
    #       set theory. It represents a function returning an integer value
    #       for the cardinality of a k-combination (i.e. binomial coefficient.)
    def C(n, r = nil)
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n
        return 0 if r.zero?
        return 1 if n == r

        factorial(n) / (factorial(r) * factorial(n - r))
      end
    end

    alias cardinality C
    alias len cardinality

    # @param [Fixnum] c input set cardinality
    # @return [Array] elements are cardinalities for each subset 1 .. c
    # @raise [RangeError] c must be non-negative
    # @example cardinality_all(4)
    # @note sum of elements will equal factorial(c)
    # @see choose
    # @see http://en.wikipedia.org/wiki/Combinations
    def cardinality_all(c)
      if c.zero?
        return []
      elsif c < 0
        raise(RangeError, 'c must be non-negative')
      end

      ret = [c]

      2.upto(c) { |x| ret << P(c, x) }

      ret
    end

    alias C_all cardinality_all
    alias len_all C_all

    # Get combinations with a specified number of elements from an input set
    # @param [Array] s the input set
    # @param [Fixnum] k cardinality of chosen subsets
    # @raise [TypeError] s must be Enumerable
    # @return [Enumerator] collection of k-sized combinations within input set
    # @example choose([1, 2], 1).to_a => [[1], [2]]
    # @see Array#combination
    # @see Combinatorics::Rearrange::rearrange
    def choose(s, k)
      return [[]].enum_for if s.nil?
      raise(TypeError, 's must be Enumerable') if not s.is_a?(Enumerable)
      return [[]].enum_for if s.empty?

      s.combination(k)
    end

    alias combos choose
  end
end
