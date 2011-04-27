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
    def cardinality(n, r = nil) 
      raise(RangeError, 'n must be non-negative') if n < 0

      if r.nil?
        Math.factorial(n)
      else
        raise(RangeError, 'r must be non-negative') if r < 0
        raise(RangeError, 'r must be less than or equal to n') if r > n

        if n.zero? or n == r 
          1
        else
          Math.factorial(n) / Math.factorial(n-r)
        end
      end
    end

    # Alias for shortened permutation cardinality method name
    alias len cardinality

    #
    # Wrappers for permutation cardinality method defined above
    #
    # @note In the study of set theory, permutations are often referenced by
    #       the name of an associated algorithm called "n-choose-r."
    #
    def Permute.N
      cardinality
    end

    def Permute.NR
      cardinality 
    end

    def Permute.R
      cardinality
    end

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

      2.upto(c) { |x| ret << cardinality(c, x) }

      ret
    end

    #
    # Aliases defining shortened method names for cardinalities of all 
    # permutations resulting from a given set.
    #
    # @see Permute.cardinality_all
    #
    # @note The letters `N' and `R' correspond to a discrete math algorithm
    #       called "n-choose-r" which calculates the number of ways to choose
    #       `r' objects from a set of cardinality `n'. More specifically, the 
    #       algorithm/notation called "n-choose-r" is better known as binomial
    #       coefficient and is the basis for Pascal's Triangle. 
    #
    # @note For those involved in the study of set theory: be careful not to 
    #       confuse these characters as references to the common sets for 
    #       natural number and real number domains as Pascal's binomial theorem 
    #       is technically a recurrence relation. It's simply difficult to 
    #       present the info accurately without MathML/LaTeX/etc. since Ruby
    #       gems usually consist of mostly ASCII-encoded documents.
    #
    # @todo Write mathematician-friendly documentation as an HTML5 web page.
    #       
    # @see http://en.wikipedia.org/wiki/Pascal's_Triangle
    #
    alias len_all cardinality_all
    alias N_all len_all
    alias NR_all len_all
    alias R_all len_all
  end
end
