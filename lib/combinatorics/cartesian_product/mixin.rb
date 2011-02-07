module Combinatorics
  module CartesianProduct
    module Mixin
      # Calculates the Cartesian product of an Enumerable object.
      #
      # @yield [subset] If a block is given, it will be passed each sub-set from the
      #   Cartesian product.
      # @yieldparam [Array] subset A sub-set from the Cartesian product.
      # @raise ArgumentError enum2 must be non-nil
      # @return [Array] The Cartesian product.
      # @example Cartesian product of an Array.
      #   [1, 2].cartprod([3, 4])
      #   # => [[1, 3], [2, 3], [1, 4], [2, 4]]
      # @example Cartesian product on a Set of strings.
      #   Set['abc', 'xyz'].cartesian_product(Set['123', '456')
      #   # => [#<Set: {}>, #<Set: {"123"}>, #<Set: {"xyz"}>,
      #         #<Set: {"abc"}>, #<Set: {"xyz", "123"}>,
      #         #<Set: {"abc", "123"}>, #<Set: {"abc", "xyz"}>,
      #         #<Set: {"abc", "xyz", "123"}>]
      # @see http://en.wikipedia.org/wiki/Cartesian_product
      def cartprod(enum2)
        raise(ArgumentError, 'enum2 must be non-nil') if not enum2

        cpset, enum1, aele2 = [], self, nil
        aele2 = enum2.first 

        if aele2.is_a?(Enumerable)
          cpset = enum1

          aele2.each{|e| cpset = cpset.cartprod(e)}
        else
          enum1.each do |elem1|
            enum2.each do |elem2|
              aset = [elem1, elem2]

              aset.flatten!

              yield aset if block_given?

              cpset << aset
            end
          end
        end

        cpset
      end

      alias cartesian_product cartprod
      alias cartesianproduct cartprod
      alias cartesian cartprod
    end
  end
end

if $0 == __FILE__
  include Combinatorics::CartesianProduct::Mixin

  puts [1].cartprod([2]).inspect # [[1, 2]]
  puts [3, 4].cartprod([5]).inspect # [[3, 5], [4, 5]]
  puts [6, 7].cartprod([8, 9]).inspect # [[6, 8], [6, 9], [7, 8], [7, 9]]
  puts [10, 11].cartprod([[12, 13], [14, 15]]).inspect
  puts [[16, 17]].cartprod([18, 19]).inspect

  puts ""

  [1].cartprod([2]){|x|
    puts "x: #{x}"
  }

  puts ""

  exit 0
end
