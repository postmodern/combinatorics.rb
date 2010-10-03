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

    ranges = self.map do |range|
      if range.kind_of?(Enumerable)
        range
      elsif range.kind_of?(Proc)
        Enumerator.new(&range)
      else
        (range..range)
      end
    end

    cycles = ranges.map { |range| range.cycle }
    values = cycles.map { |range| range.next }

    loop do
      yield values

      (cycles.length - 1).downto(0) do |index|
        values[index] = cycles[index].next
        break unless values[index] == ranges[index].first

        return nil if index == 0
      end
    end
  end

end
