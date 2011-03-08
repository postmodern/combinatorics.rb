require 'combinatorics/extensions/math'

module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module Permute
    include Math

    #
    # Mathematically determine the number of elements in a r-permutations
    # set.
    # 
    # @param [Fixnum] n
    #   The number of elements in the input set.
    #
    # @param [Fixnum] r
    #   Cardinality of permuted subsets.
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
    #   The product of the first `r` factors of `n`.
    #
    # @example Calculate total 4-permutations for a set whose cardinality is 6
    #   P(6, 4)
    #   # => 360
    #
    # @see http://en.wikipedia.org/wiki/Permutations
    #
    # @note
    #   This method's naming convention reflects well-known notation used 
    #   within fields of academic inquiry such as discrete mathematics and
    #   set theory. It represents a function returning an integer value
    #   for the cardinality of a r-permutation.
    #
    def P(n, r = nil) 
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n

        if n.zero? or n == r 
          1
        else
          factorial(n) / factorial(n-r)
        end
      end
    end

    alias cardinality P
    alias len cardinality

    #
    # Compute cardinality of all r-permutations for a set with cardinality c
    #
    # @param [Fixnum] c
    #   Input set cardinality.
    #
    # @return [Array]
    #   Elements are cardinalities for each subset `1 .. c`.
    #
    # @raise [RangeError]
    #   `c` must be non-negative.
    #
    # @example cardinality_all(4)
    #   # => [4, 3, 10, 1]
    #
    # @note sum of elements will equal `factorial(c)`
    #
    # @see http://en.wikipedia.org/wiki/Permutations
    #
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
  end
end
