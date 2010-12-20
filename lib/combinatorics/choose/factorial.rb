module Combinatorics
  module Choose
    def factorial(number = 1)
      count, product = 0, 1

      number.times do
        count += 1
        product *= count
      end

      product
    end
  end
end

if $0 == __FILE__
  include Combinatorics, Combinatorics::Choose

  puts factorial(10) 

  exit 0
end
