require 'combinatorics/list_comprehension'

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
      # @example Cartesian product over an Array of Strings
      #   ['a'].cartprod(['b', 'c', 'd']).to_a
      #   # => [["a", "b"], ["a", "c"], ["a", "d"]]
      #
      # @example Three-way Cartesian product operation
      #   
      # @see http://en.wikipedia.org/wiki/Cartesian_product
      #
      def cartesian_product(*others,&block)
        return enum_for(:cartesian_product,*others) unless block

        # a single empty Set will result in an empty Set
        return nil if (empty? || others.any?(&:empty?))

        Array[self,*others].comprehension(&block)
      end

      alias cartprod  cartesian_product
      alias cartesian cartesian_product
    end
  end
end
