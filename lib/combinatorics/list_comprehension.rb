# frozen_string_literal: true

require_relative 'enumerator'

class Array

  #
  # Iterates over each permutation of the enumerable values within the
  # {Array}.
  #
  # @yield [list]
  #   The given block will be passed each permutation of the enumerable
  #   values in the {Array}.
  #
  # @yieldparam [Array] list
  #   A permutation of the enumerable values within the {Array}.
  #
  # @return [Enumerator]
  #   If no block is given, an enumerator object will be returned.
  #
  # @example
  #   [(1..5),(1..4),(1..3)].comprehension.to_a
  #   # => [
  #     [1, 1, 1], [1, 1, 2], [1, 1, 3],
  #     [1, 2, 1], [1, 2, 2], [1, 2, 3],
  #     [1, 3, 1], [1, 3, 2], [1, 3, 3],
  #     [1, 4, 1], [1, 4, 2], [1, 4, 3],
  #     [2, 1, 1], [2, 1, 2], [2, 1, 3],
  #     [2, 2, 1], [2, 2, 2], [2, 2, 3],
  #     [2, 3, 1], [2, 3, 2], [2, 3, 3],
  #     [2, 4, 1], [2, 4, 2], [2, 4, 3],
  #     [3, 1, 1], [3, 1, 2], [3, 1, 3],
  #     [3, 2, 1], [3, 2, 2], [3, 2, 3],
  #     [3, 3, 1], [3, 3, 2], [3, 3, 3],
  #     [3, 4, 1], [3, 4, 2], [3, 4, 3],
  #     [4, 1, 1], [4, 1, 2], [4, 1, 3],
  #     [4, 2, 1], [4, 2, 2], [4, 2, 3],
  #     [4, 3, 1], [4, 3, 2], [4, 3, 3],
  #     [4, 4, 1], [4, 4, 2], [4, 4, 3],
  #     [5, 1, 1], [5, 1, 2], [5, 1, 3],
  #     [5, 2, 1], [5, 2, 2], [5, 2, 3],
  #     [5, 3, 1], [5, 3, 2], [5, 3, 3],
  #     [5, 4, 1], [5, 4, 2], [5, 4, 3]
  #   ]
  #
  def comprehension
    return enum_for(:comprehension) unless block_given?

    if empty?
      yield self
      return nil
    end

    enums = self.map do |value|
      case value
      when Combinatorics::Enumerator
        value
      when Enumerable
        value.enum_for
      else
        [value].enum_for
      end
    end

    iteration = enums.map { |e| e.next }

    loop do
      yield iteration.dup

      (enums.length - 1).downto(0) do |index|
        begin
          iteration[index] = enums[index].next
          break
        rescue StopIteration
          enums[index].rewind
          iteration[index] = enums[index].next
        end

        return nil if index == 0
      end
    end
  end

end
