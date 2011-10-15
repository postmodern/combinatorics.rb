require 'combinatorics/choose'

module Combinatorics
  module PowerSet
    module Mixin
      include Choose::Mixin

      #
      # Calculates the power-set of an Enumerable object.
      #
      # @yield [subset]
      #   If a block is given, it will be passed each sub-set from the
      #   power-set.
      #
      # @yieldparam [Array] subset
      #   A sub-set from the power-set.
      #
      # @return [Enumerator]
      #   The power set.
      #
      # @example Power-set on a Set of strings.
      #   Set['abc', 'xyz', '123'].powerset.to_a
      #   # => [#<Set: {}>, #<Set: {"123"}>, #<Set: {"xyz"}>,
      #         #<Set: {"abc"}>, #<Set: {"xyz", "123"}>,
      #         #<Set: {"abc", "123"}>, #<Set: {"abc", "xyz"}>,
      #         #<Set: {"abc", "xyz", "123"}>]
      #
      def powerset(&block)
        return enum_for(:powerset) unless block

        0.upto(length) { |n| self.choose(n,&block) }
      end

      alias power_set powerset
    end
  end
end
