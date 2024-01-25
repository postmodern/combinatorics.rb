# frozen_string_literal: true

#
# @author duper <super@manson.vistech.net>
#
module Math
  #
  # Mathematical summation (invokes a block for k = 1 until ++k = n).
  #
  # @param [Range] r
  #   Range containing the number of times to yield.
  #
  # @yield [i]
  #   The given block is expected to return an Integer, which is added to the
  #   total sum.
  #
  # @yieldparam [Integer] i
  #   An element from `r`.
  #
  # @return [Integer]
  #   Total sum after yielding for each element in `r`.
  #
  # @raise [TypeError]
  #   `r` must be a {Range}.
  #
  # @example
  #   sigma(1..4) { |i| i }
  #   # => 10
  #
  # @note
  #   "chalkboard" notation for summation is the capital Greek letter Sigma.
  #
  # @see http://en.wikipedia.org/wiki/Summation
  #
  # @since 0.4.0
  #
  def Math.sigma(r)
    unless r.kind_of?(Range)
      raise(TypeError,"r must be a Range")
    end

    k = 0

    if block_given?
      r.each { |n| k += yield n }
    else
      r.each { |n| k += n }
    end

    k
  end

  #
  # CamelCase alias for sigma (defined above)
  #
  # @see Math.sigma
  #
  # @since 0.4.0
  #
  def Math.Sigma(r)
    Math.sigma(r)
  end

  #
  # Pi notation for iterative product computations.
  #
  # @param [Range<Integer>] r
  #   Inclusive range of Integers.
  #
  # @yield [i]
  #   The given block will be passed elements of `r`. The return value from
  #   the block will be combined with the product.
  #
  # @yield [Integer] i
  #   An element from `r`.
  #
  # @return [Integer]
  #   The total product after iterating over each element in `r`.
  #
  # @raise [TypeError]
  #   `r` must be a Range.
  #
  # @example
  #   Math.pi(1..4)
  #   # => 24
  #
  # @see http://en.wikipedia.org/wiki/Pi_notation#Capital_Pi_notation
  #
  # @since 0.4.0
  #
  def Math.pi(r)
    unless r.kind_of?(Range)
      raise(TypeError,"r must be a Range")
    end

    k = 1

    if block_given?
      r.each { |n| k *= yield n }
    else
      r.each { |n| k *= n }
    end

    k
  end

  #
  # CamelCase alias for pi (defined above)
  #
  # @see Math.pi
  #
  # @since 0.4.0
  #
  def Math.Pi(r)
    Math.pi(r)
  end
  
  #
  # Subfactorial function for calculation of derangement cardinalities.
  #
  # @param [Fixnum] n
  #   The length of sequence.
  #
  # @raise [RangeError]
  #   `n` must be non-negative.
  #
  # @return [Integer]
  #   Cardinality of derangements set.
  #
  # @example
  #   subfactorial([1, 2, 3].size)
  #   # => 2
  #
  # @note The notation used in academia for subfactorial notation is "!n"
  #
  # @see http://mathworld.wolfram.com/Subfactorial.html
  # @see Derange.cardinality
  #
  # @since 0.4.0
  #
  def Math.subfactorial(n)
    if    n >= 1 then ((Math.factorial(n) + 1) / Math::E).floor
    elsif n == 0 then 1
    else
      raise(RangeError,"n must be non-negative")
    end
  end

  # 
  # Apply the well-known factorial function to the given Integer.
  #
  # @param [Fixnum] x
  #   Positive integer to apply algebraic factorial function to.
  #
  # @return [Integer]
  #   Solution to factorial function as a whole number.
  #
  # @raise [RangeError]
  #   The given number must be non-negative.
  #
  # @example
  #   factorial(4)
  #   # => 24
  #
  # @note The factorial of zero equals one!
  #
  # @see http://en.wikipedia.org/wiki/Factorial
  #
  # @since 0.4.0
  #
  def Math.factorial(x=1)
    if    x >= 1  then pi(1..x)
    elsif x == 0  then 1
    else
      raise(RangeError,"x must be non-negative")
    end
  end
end
