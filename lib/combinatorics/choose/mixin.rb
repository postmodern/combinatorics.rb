require 'set'

module Combinatorics
  module Choose
    #
    # @author duper <super@manson.vistech.net>
    #
    # @since 0.4.0
    #
    module Mixin
      #
      # Get combinations with a specified number of elements from an input
      # set.
      #
      # @param [Fixnum] k
      #   Cardinality of chosen subsets
      #
      # @yield [combo]
      #   The given block will be passed each combination.
      #
      # @yieldparam [Array] combo
      #   A k-sized combination of elements from the set.
      #
      # @raise [TypeError]
      #   `self` must be Enumerable.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator of the k-sized combinations
      #   within the set will be returned.
      #
      # @example
      #   [1, 2].choose(1).to_a 
      #   # => [#<Set: {1}>, #<Set: {2}>]
      #
      # @see Array#combination
      #
      def choose(k,&block)
        return enum_for(:choose,k) unless block

        unless kind_of?(Enumerable)
          raise(TypeError,"#{inspect} must be Enumerable")
        end

        self.to_a.combination(k) do |subset|
          yield Set.new(subset)
        end
      end

      alias combinations choose
    end
  end
end
