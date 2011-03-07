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
      # @return [Enumerator]
      #   k-permutations of elements from `self`.
      #
      # @raise [TypeError]
      #   `self` must be Enumerable.
      #
      # @example permute([1, 2], 1).to_a
      #   # => [[1], [2]]
      #
      # @see Array#permutation
      #
      def permute(r)
        return [[]].enum_for if self.nil?
        raise(TypeError, 'self must be Enumerable') if not self.is_a?(Enumerable)
        return [[]].enum_for if self.empty?

        self.to_a.permutation(r)
      end

      alias rearrange permute
    end
  end
end
