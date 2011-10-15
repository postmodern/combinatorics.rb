require 'combinatorics/extensions/math'

module Combinatorics
  #
  # @author duper <super@manson.vistech.net>
  #
  # @since 0.4.0
  #
  module Permute
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
    #   cardinality(6, 4)
    #   # => 360
    #
    # @see http://en.wikipedia.org/wiki/Permutations
    #
    # @note
    #   This function is well-known within fields of academic inquiry such as 
    #   discrete mathematics and set theory. It is represented in "chalkboard"
    #   notation by the letter "P."
    #
    def self.cardinality(n,r=nil) 
      raise(RangeError, 'n must be non-negative') if n < 0

      case r
      when 0   then 0
      when nil then Math.factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n

        Math.factorial(n) / Math.factorial(n - r)
      end
    end

    #
    # @see cardinality
    #
    # @note In the study of set theory, permutations are often referenced by
    #       the name of an associated algorithm called "n-choose-r."
    #
    def self.N(n,r=nil);  cardinality(n,r); end
    def self.NR(n,r=nil); cardinality(n,r); end
    def self.R(n,r=nil);  cardinality(n,r); end

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
    def self.cardinality_all(n,c=(1..n))
      if n < 0
        raise(RangeError, 'n must be non-negative')
      end

      c.map { |r| cardinality(n,r) }
    end

    def self.N_all(c);  cardinality_all(c); end
    def self.NR_all(c); cardinality_all(c); end
    def self.R_all(c);  cardinality_all(c); end
  end
end
