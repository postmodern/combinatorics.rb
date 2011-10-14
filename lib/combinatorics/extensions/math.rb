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
  # @see http://en.wikipedia.org/wiki/Summation
  #
  # @note
  #   "chalkboard" notation for summation is the capital Greek letter Sigma.
  #
  # @todo
  #   should the second function argument be "k = 1" ?
  #   if so, raise a RangeError if k is negative.
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
  def Math.pi(r)
    unless r.kind_of?(Range)
      raise(TypeError, 'r must be a Range')
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
  # @see http://mathworld.wolfram.com/Subfactorial.html
  #
  # @see Derange.cardinality
  #
  # @note The notation used in academia for subfactorial notation is "!n"
  #
  def Math.subfactorial(n)
    if n >= 1
      ((Math.factorial(n) + 1) / Math::E).floor
    elsif n == 0
      1
    else
      raise(RangeError, 'n must be non-negative')
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
  # @see http://en.wikipedia.org/wiki/Factorial
  #
  # @note The factorial of zero equals one!
  #
  def Math.factorial(x=1)
    if x >= 1
      pi(1..x)
    elsif x.zero?
      1
    else
      raise(RangeError, 'x must be non-negative')
    end
  end

  private

  # 
  # Helper function for Math.get_fractions
  #
  def Math.partial_factorial(j,k)
    Math.pi(k..j)
  end

  #
  # Helper function for Math.subfactorial
  #
  def Math.fractions(n)
    n.downto(1) { |x| yield partial_factorial(n,x) }
  end
end
