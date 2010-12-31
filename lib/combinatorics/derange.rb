require 'combinatorics/choose'
require 'combinatorics/list_comprehension'

module Combinatorics
  module Derange
    include Choose

    #
    # @param [Array] a
    #   Sequence to output derangements for.
    #
    # @return [Array]
    #   Set of the derangements for input sequence
    #
    # @example
    #   derange([1,2,3])
    #   # => [
    #          [2, 1, 1], [2, 1, 2],
    #          [2, 3, 1], [2, 3, 2],
    #          [3, 1, 1], [3, 1, 2],
    #          [3, 3, 1], [3, 3, 2]
    #        ]
    #
    # @see http://en.wikipedia.org/wiki/Derangements
    # @see Array#comprehension 
    #
    # @since 0.4.0
    #
    def derange(a)
      c = []

      for i in 0 .. a.size - 1
        c << a - [a[i]]
      end

      # @todo
      #   wouldn't it be better to yield Enumerators for combinatorics 
      #   methods that do set generation? (i.e. power_set, choose, derange,
      #   etc.) so the ronin-fuzzer doesn't have to wait on the computation.
      c.comprehension.to_a
    end

    #
    # @param [Fixnum] n
    #   Length of sequence.
    #
    # @return [Integer]
    #   Cardinality of derangements set.
    #
    # @example
    #   subfactorial([1,2,3].length)
    #   # => 2
    #
    # @see http://mathworld.wolfram.com/Subfactorial.html
    #
    # @since 0.4.0
    #
    def subfactorial(n)
      add, sum = false, 0

      return sum if n.zero?

      get_fractions(n).each do |f|
        if add = !add
          sum += f
        else
          sum -= f
        end
      end

      (1 - sum).abs.to_i
    end

    #
    # @see subfactorial
    #
    # @since 0.4.0
    #
    def cardinality(n)
      subfactorial(n)
    end

    #
    # Discrete math notation.
    #
    # @see subfactorial
    #
    # @since 0.4.0
    #
    def D(n) 
      subfactorial(n)
    end

    #
    # @todo
    #   define operators for combinatorics functions? i.e. *** represents
    #   partial_factorial, n! represents factorial and !n subfactorial.
    #
    # @since 0.4.0
    #
    def partial_factorial(j, k)
      r = j

      (j -= 1).downto(k){|n| r *= n}
     
      r
    end

    #
    # @since 0.4.0
    #
    def get_fractions(n)
      a = []

      n.downto(1){|x| a << partial_factorial(n, x)}

      a
    end
  end
end
