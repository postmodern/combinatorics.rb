# frozen_string_literal: true

module Combinatorics
  module Derange
    #
    # @author duper <super@manson.vistech.net>
    #
    # @since 0.4.0
    #
    module Mixin
      #
      # Calculate all derangements for an Enumerable object.
      #
      # @yield [derangement] 
      #   If a block is given, it will be passed an Array representing
      #   an individual derangement from the full calculation.
      #
      # @yieldparam [Array] derangement
      #   One of the calculated derangements.
      #
      # @return [Enumerator] 
      #   If no block is given, an Enumerator of all derangements will be
      #   returned.
      #
      # @example Produce the derangements of a three-element Array
      #   [1, 2, 3].derange.to_a
      #   # => [[2, 3, 1], [3, 1, 2]]
      #
      # @see http://en.wikipedia.org/wiki/Derangements
      # @see http://mathworld.wolfram.com/Derangement.html
      #
      def derange
        return enum_for(:derange) unless block_given?

        if size <= 1
          yield []
        else
          elements = self.to_a

          elements.permutation do |x|
            unless elements.each_with_index.any? { |e,i| e == x[i] }
              yield x
            end
          end
        end
      end
    end
  end
end
