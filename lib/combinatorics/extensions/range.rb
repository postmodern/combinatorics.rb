class Range

  #
  # Finds the intersecting sub-range.
  #
  # @param [Range] other
  #   The other range.
  #
  # @return [Range]
  #   The intersecting sub-range.
  #
  # @example
  #   (1..100) & (20..200)
  #   # => 20..100
  #
  # @since 0.2.0
  #
  def &(other)
    Range.new(
      [self.first, other.first].max,
      [self.last, other.last].min
    )
  end
  
  #
  # Iterates over every sub-range up to the other range.
  #
  # @param [Range] other
  #   The upper bounding range.
  #
  # @yield [subrange]
  #   The given block will be passed every sub-range between the two ranges.
  #
  # @yieldparam [Range] subrange
  #   A sub-range bounded by the beginning of the range and the ending of
  #   the other range.
  #
  # @return [Enumerator]
  #   If no block is given, an enumerator object will be returned.
  #
  # @example
  #   (1..5).upto(2..7).to_a
  #   # => [1..5, 1..6, 1..7, 2..5, 2..6, 2..7]
  #
  # @since 0.2.0
  #
  def upto(other)
    return enum_for(:upto,other) unless block_given?

    unless other.kind_of?(Range)
      raise(TypeError,"bad value for range",caller)
    end

    self.first.upto(other.first) do |start|
      self.last.upto(other.last) do |stop|
        yield (start..stop)
      end
    end
  end

  #
  # Iterates over every sub-range down to the other range.
  #
  # @param [Range] other
  #   The lower bounding range.
  #
  # @yield [subrange]
  #   The given block will be passed every sub-range between the two ranges.
  #
  # @yieldparam [Range] subrange
  #   A sub-range bounded by the beginning of the other range and the
  #   ending of the range.
  #
  # @return [Enumerator]
  #   If no block is given, an enumerator object will be returned.
  #
  # @example
  #   (2..7).downto(1..5).to_a
  #   # => [2..7, 2..6, 2..5, 1..7, 1..6, 1..5]
  #
  # @since 0.2.0
  #
  def downto(other)
    return enum_for(:downto,other) unless block_given?

    unless other.kind_of?(Range)
      raise(TypeError,"bad value for range",caller)
    end

    self.first.downto(other.first) do |start|
      self.last.downto(other.last) do |stop|
        yield (start..stop)
      end
    end
  end

end
