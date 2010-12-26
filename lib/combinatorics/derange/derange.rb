require 'combinatorics/choose'
require 'combinatorics/list_comprehension'

module Combinatorics
  module Derange
    include Choose

    # @param [Array] a sequence to output derangements for
    # @return [Array] set of the derangements for input sequence
    # @example derange([1,2,3])
    # @see http://en.wikipedia.org/wiki/Derangements
    # @see Array#comprehension 
    def derange(a)
      c = []

      for i in 0 .. a.size - 1
        c << a - [a[i]]
      end

      # @todo wouldn't it be better to yield Enumerators for combinatorics 
      #   methods that do set generation? (i.e. power_set, choose, derange, etc.)
      #   so the ronin-fuzzer doesn't have to wait on the computation..
      c.comprehension.to_a
    end

    # @param Fixnum length of sequence 
    # @return cardinality of derangements set 
    # @example subfactorial([1,2,3].size)
    # @see http://mathworld.wolfram.com/Subfactorial.html
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

    def cardinality(n)
      subfactorial(n)
    end

    def D(n) # discrete math notation
      subfactorial(n)
    end

    # @todo: define operators for combinatorics functions? i.e. *** represents
    #   partial_factorial, n! represents factorial and !n subfactorial..
    def partial_factorial(j, k)
      r = j

      (j -= 1).downto(k){|n| r *= n}
     
      r
    end

    def get_fractions(n)
      a = []

      n.downto(1){|x| a << partial_factorial(n, x)}

      a
    end
  end
end
