# frozen_string_literal: true

module Combinatorics
  module PowerSet
    #
    # @author postmodern <postmodern.mod3@gmail.com>
    #
    module Mixin
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
      #   # => [#<Set: {}>,
      #         #<Set: {"123"}>,
      #         #<Set: {"xyz"}>,
      #         #<Set: {"abc"}>,
      #         #<Set: {"xyz", "123"}>,
      #         #<Set: {"abc", "123"}>,
      #         #<Set: {"abc", "xyz"}>,
      #         #<Set: {"abc", "xyz", "123"}>]
      #
      def powerset
        return enum_for(:powerset) unless block_given?

        elements = self.to_a
        elements.uniq!

        0.upto(elements.length) do |k|
          elements.combination(k) do |subset|
            yield Set.new(subset)
          end
        end
      end

      alias power_set powerset
    end
  end
end
