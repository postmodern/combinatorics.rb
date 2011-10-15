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
    # @example
    #   cardinality(6, 4)
    #   # => 15
    #
    # @see http://en.wikipedia.org/wiki/Binomial_coefficient
    #
    def self.cardinality(n,r=nil)
      raise(RangeError, 'n must be non-negative') if n < 0

      case r
      when 0   then 0
      when nil then Math.factorial(n)
      else
        Math.factorial(n) / (Math.factorial(r) * Math.factorial(n - r))
      end
    end

    # 
    # Wrapper for combination cardinality method defined above. The letter `C'
    # is "chalkboard" notation for subset cardinality.
    #
    # @note
    #   This method's naming convention reflects well-known notation used
    #   within fields of academic inquiry such as discrete mathematics and
    #   set theory. It represents a function returning an integer value
    #   for the cardinality of a k-combination (i.e. binomial coefficient.)
    #
    # @see Choose.cardinality
    #
    def self.C(n,r=nil)
      cardinality(n,r)
    end

    #
    # @param [Integer] n
    #   The total number of choices.
    #
    # @param [Enumerable] c
    #   The set of `r` values to choose from `n`.
    #
    # @return [Array]
    #   Elements are cardinalities for each subset "1" through "c".
    #
    # @raise [RangeError]
    #   `n` must be non-negative.
    #
    # @example
    #   cardinality_all(4)
    #   # => [4, 6, 4, 1]
    #
    # @example
    #   cardinality_all(10, 5..10)
    #   # => [252, 210, 120, 45, 10, 1]
    #
    # @note
    #   Sum of elements will equal Math.factorial(c)
    #
    # @see cardinality
    # @see http://en.wikipedia.org/wiki/Combinations
    # 
    def self.cardinality_all(n,c=(1..n))
      if n < 0
        raise(RangeError, 'c must be non-negative')
      end

      c.map { |r| cardinality(n,r) }
    end
  end
end
