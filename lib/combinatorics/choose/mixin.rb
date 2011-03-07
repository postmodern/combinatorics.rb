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
      # @raise [TypeError]
      #   `self` must be Enumerable.
      #
      # @return [Enumerator]
      #   Collection of k-sized combinations within input set.
      #
      # @example
      #   [1, 2].choose(1).to_a 
      #   # => [[1], [2]]
      #
      # @see Array#combination
      #
      def choose(k)
        return [[]].enum_for if self.nil?
        raise(TypeError, 'self must be Enumerable') if not self.is_a?(Enumerable)
        return [[]].enum_for if self.empty?

        self.to_a.combination(k)
      end

      alias combos choose
    end
  end
end
