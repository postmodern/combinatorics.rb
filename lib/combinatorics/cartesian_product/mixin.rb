require 'combinatorics/generator'

module Combinatorics
  module CartesianProduct
    #
    # @author duper <super@manson.vistech.net>
    #
    # @since 0.4.0
    #
    module Mixin
      #
      # Calculates the Cartesian product of an Enumerable object.
      #
      # @yield [subset]
      #   If a block is given, it will be passed each individual subset
      #   element from the Cartesian product set as a whole.
      #
      # @yieldparam [Array] subset
      #   The sub-set from the Cartesian product.
      #
      # @return [Enumerator]
      #   Resulting Cartesian product set.
      #
      # @raise [TypeError]
      #   `other` must be Enumerable.
      #
      # @example Cartesian product of an Array
      #   [1, 2].cartprod([3, 4])
      #   # => [[1, 3], [2, 3], [1, 4], [2, 4]]
      #
      # @example Cartesian product over an Array of string Array's
      #   ['a'].cartprod([['b'], ['c'], ['d']]).to_a
      #   # => [["a", "b", "c", "d"]]
      #
      # @example Three-way Cartesian product operation
      #   
      # @see http://en.wikipedia.org/wiki/Cartesian_product
      #
      def cartprod(other)
        return enum_for(:cartprod,other) unless block_given?

        unless other.kind_of?(Enumerable)
          raise(TypeError, 'cartprod requires another Enumerable object')
        end

        other.each do |x|
          self.each do |y|
            z = [y, x]
            z.flatten!

            yield z
          end
        end
      end

      alias cartesian_product cartprod
      alias cartesianproduct cartprod
      alias cartesian cartprod
    end
  end
end
