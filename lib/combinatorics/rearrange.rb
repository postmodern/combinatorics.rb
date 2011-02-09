# @author duper <super@manson.vistech.net>

require 'combinatorics/extensions/math'

module Combinatorics
  module Rearrange
    include Math

    # @param [Fixnum] n the number of elements in the input set
    # @param [Fixnum] r cardinality of permuted subsets
    # @raise [RangeError] n must be non-negative
    # @raise [RangeError] r must be non-negative
    # @raise [RangeError] r must be less than or equal to n
    # @return [Fixnum] the product of the first r factors of n
    # @example P(6, 4)
    # @see http://en.wikipedia.org/wiki/Permutations
    # @note This method's naming convention reflects well-known notation used 
    #       within fields of academic inquiry such as discrete mathematics and
    #       set theory. It represents a function returning an integer value
    #       for the cardinality of a r-permutation.
    def P(n, r = nil) 
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n
        return 1 if n.zero? or n == r 

        factorial(n) / factorial(n-r)
      end
    end

    alias cardinality P
    alias len cardinality

    # @param [Fixnum] c input set cardinality
    # @return [Array] elements are cardinalities for each subset 1 .. c
    # @raise [RangeError] c must be non-negative
    # @example cardinality_all(4)
    # @note sum of elements will equal factorial(c)
    # @see rearrange
    # @see http://en.wikipedia.org/wiki/Permutations
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

    alias P_all cardinality_all
    alias len_all P_all

    # Enumerate permutations for a particular sequence of elements
    # @param [Array] s the input set
    # @param [Fixnum] length of permuted subsets to return
    # @return [Enumerator] k-permutations of elements from s
    # @raise [TypeError] s must be Enumerable
    # @example rearrange([1, 2], 1)
    # @see Array#permutation
    def rearrange(s, k)
      return [[]].enum_for if s.nil?
      raise(TypeError, 's must be Enumerable') if not s.is_a?(Enumerable)
      return [[]].enum_for if s.empty?

      s.permutation(k)
    end

    alias permute rearrange
  end
end
