# @author duper <super@manson.vistech.net>

module Combinatorics
  module CartesianProduct
    module Mixin
      #
      # Calculates the Cartesian product of an Enumerable object.
      #
      # @yield [subset] If a block is given, it will be passed each individual
      #   subset element from the Cartesian product set as a whole
      #
      # @yieldparam [Array] subset The sub-set from the Cartesian product
      #
      # @raise [ArgumentError] enum2 must be non-nil
      #
      # @return [Enumerator] Resulting Cartesian product set
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
      def cartprod(enum2)
        raise(ArgumentError, 'enum2 must be non-nil') if not enum2

        enum1, aele2 = self, nil
        aele2 = enum2.first if enum2.respond_to?(:first)

        if aele2.is_a?(Enumerable)
          enum2.inject(enum1){|m, o| m.to_a.cartprod(o)}
        else
          Enumerator.new do |e|
            enum2.each do |x|
              enum1.each do |y|
                z = [y, x]

                z.flatten!

                e << z
              end
            end
          end
        end
      end

      alias cartesian_product cartprod
      alias cartesianproduct cartprod
      alias cartesian cartprod
      # @note: 'X' is the formal set theory symbol for Cartesian Product
      alias X cartprod 
    end
  end
end
