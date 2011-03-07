# @author duper <super@manson.vistech.net>

module Combinatorics
  module Permute
    module Mixin
      #
      # Enumerate distinct r-permutations for a particular sequence of elements
      #
      # @param [Array] s the input set
      #
      # @param [Fixnum] r Length of permuted subsets to return
      #
      # @return [Enumerator] k-permutations of elements from s
      #
      # @raise [TypeError] s must be Enumerable
      #
      # @example permute([1, 2], 1).to_a
      #   # => [[1], [2]]
      #
      # @see Array#permutation
      #
      def permute(s, r)
        return [[]].enum_for if s.nil?
        raise(TypeError, 's must be Enumerable') if not s.is_a?(Enumerable)
        return [[]].enum_for if s.empty?

        s.permutation(r)
      end

      alias rearrange permute
    end
  end
end
