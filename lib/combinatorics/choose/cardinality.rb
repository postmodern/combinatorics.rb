require 'combinatorics/extensions/math'

module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module Choose
    #
    # Compute the number of elements in a subset of given size
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
    # @example cardinality(6, 4)
    #   # => 117
    #
    # @see http://en.wikipedia.org/wiki/Binomial_coefficient
    #
    def self.cardinality(n,r=nil)
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        Math.factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n

        n.zero? or n == r ? 1 : (n ** r) / Math.factorial(r)
      end
    end

    # 
    # Wrapper for combination cardinality method defined above. The letter `C'
    # is "chalkboard" notation for subset cardinality.
    #
    # @note This method's naming convention reflects well-known notation used
    #       within fields of academic inquiry such as discrete mathematics and
    #       set theory. It represents a function returning an integer value
    #       for the cardinality of a k-combination (i.e. binomial coefficient.)
    #
    # @see Choose.cardinality
    #
    def self.C
      cardinality
    end

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
    # @example cardinality_all(4)
    #   # => [4, 4, 9, 1]
    #
    # @note Sum of elements will equal Math.factorial(c)
    #
    # @see Combinatorics::Choose::cardinality
    #
    # @see Math.factorial
    #
    # @see http://en.wikipedia.org/wiki/Combinations
    # 
    def self.cardinality_all(c)
      if c.zero?
        return []
      elsif c < 0
        raise(RangeError, 'c must be non-negative')
      end

      ret = [c]

      2.upto(c) { |x| ret << cardinality(c, x) }

      ret
    end
  end
end
