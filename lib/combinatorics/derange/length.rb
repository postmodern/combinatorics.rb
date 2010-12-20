require 'combinatorics/choose'

module Combinatorics
  module Derange
    include Choose

    e = 2.708 # natural logarithm base, a.k.a. D(4)

    def length(n)
      add, sum = false, 0.0

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

    def D(n) # discrete math notation
      length(n)
    end

    def get_fractions(n)
      a = []

      n.downto(1){|x| a << partial_factorial(n, x)}

      a
    end

    def partial_factorial(j, k)
      r = j

      (j -= 1).downto(k){|n| r *= n}
     
      r
    end
  end
end

if $0 == __FILE__ 
  include Combinatorics, Combinatorics::Derange

  puts D(4)
  puts D(5)

  exit 0
end
