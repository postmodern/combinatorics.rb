module Combinatorics
  module Permute
    #
    # @author duper <super@manson.vistech.net>
    #
    # @since 0.4.0
    #
    module Mixin
      #
      # Enumerate distinct r-permutations for a particular sequence of
      # elements.
      #
      # @param [Fixnum] r
      #   Length of permuted subsets to return.
      #
      # @yield [permutation]
      #   If a block is given, it will be passed each k-permutation.
      #
      # @yieldparam [Array] permutation
      #   A k-permutation of the elements from `self`.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator of the k-permutations of
      #   elements from `self` is returned.
      #
      # @raise [TypeError]
      #   `self` must be Enumerable.
      #
      # @example
      #   [1, 2, 3].permute(2).to_a
      #   # => [[1, 2], [1, 3],
      #   #     [2, 1], [2, 3],
      #   #     [3, 1], [3, 2]]
      #
      # @see Array#permutation
      #
      def permute(r,&block)
        return enum_for(:permute,r) unless block

        unless kind_of?(Enumerable)
          raise(TypeError,"#{inspect} must be Enumerable")
        end

        self.to_a.permutation(r,&block)
      end

      alias rearrange permute
    end
  end
end
