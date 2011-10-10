# @author duper <super@manson.vistech.net>

module Math
  #
  # Mathematical summation (invokes a block for k = 1 until ++k = n)
  #
  # @param [Range] r
  #   Range containing the number of times to yield.
  #
  # @yield [i]
  #   The given block is expected to return an Integer, which is added to the
  #   total sum.
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
  # @note "chalkboard" notation for summation is the capital Greek letter Sigma
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
  def Math.Sigma
    Math.sigma
  end

  #
  # Pi notation for iterative product computations
  #
  # @param [Range] r inclusive range of integers
  #
  # @yield [] code block to apply elements of r to and return a Fixnum
  #
  # @return [Fixnum] total product after calling b for each element in r
  #
  # @raise [TypeError] r must be a Range
  #
  # @example pi(1 .. 4) { |i| i }
  #   # => 24
  #
  # @see http://en.wikipedia.org/wiki/Pi_notation#Capital_Pi_notation
  def Math.pi(r)
    raise(TypeError, 'r must be a Range') if not r.is_a?(Range)

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
  def Math.Pi
    Math.pi
  end
  

  #
  # Subfactorial function for calculation of derangement cardinalities
  #
  # @param [Fixnum] n length of sequence
  #
  # @raise [RangeError] n must be non-negative
  #
  # @return [Fixnum] cardinality of derangements set
  #
  # @example subfactorial([1, 2, 3].size)
  #   # => 2
  #
  # @see http://mathworld.wolfram.com/Subfactorial.html
  #
  # @see Derange.cardinality
  #
  # @note The notation used in academia for subfactorial notation is "!n"
  #
  def Math.subfactorial(n)
    raise(RangeError, 'n must be non-negative') if n < 0

    add, sum = false, 0

    get_fractions(n).each do |f|
      if (add = !add)
        sum += f
      else
        sum -= f
      end
    end

    (1 - sum).abs.to_i
  end

  # 
  # Apply the well-known factorial function to the given integer
  #
  # @param [Fixnum] x positive integer to apply algebraic factorial function to
  #
  # @return [Fixnum] solution to factorial function as a whole number
  #
  # @raise [RangeError] number must be non-negative
  #
  # @example factorial(4)
  #   # => 24
  #
  # @see http://en.wikipedia.org/wiki/Factorial
  #
  # @note the factorial of zero equals one!
  #
  def Math.factorial(x = 1)
    raise(RangeError, 'x must be non-negative') if x < 0

    x.zero? ? 1 : sigma(1 .. x)
  end

  private

  # 
  # Helper function for Math.get_fractions
  #
  def Math.partial_factorial(j, k)
    r = j
    j -= 1
  
    j.downto(k) { |n| r *= n }
  
    r
  end

  #
  # Helper function for Math.subfactorial
  #
  def Math.get_fractions(n)
    a = []

    n.downto(1) { |x| a << partial_factorial(n, x) }

    a
  end
end
