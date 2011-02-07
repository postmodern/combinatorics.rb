# @author duper <super@manson.vistech.net>

module Math
  # Sigma notation for summation operations
  # @param [Range] r range containing the number of times to execute block
  # @yield [] block of code returning a Fixnum to iteratively total sum
  # @return [Fixnum] sum after calling block for each element in r
  # @example sigma(1..10){|i| i * 4}
  # @see http://en.wikipedia.org/wiki/Summation
  def sigma(r)
    k = 0

    if block_given?
      r.each { |n| k += yield }
    else
      r.each { |n| k += n }
    end

    k
  end

  alias S sigma

  # Pi notation for iterative product computations
  # @param [Range] r inclusive range of integers
  # @yield [] code block to apply elements of r to and return a Fixnum
  # @return [Fixnum] total product after calling b for each element in r
  # @example pi(1..4){|i| i}
  # @see http://en.wikipedia.org/wiki/Pi_notation#Capital_Pi_notation
  def pi(r)
    k = 0

    if block_given?
      r.each { |n| k *= yield }
    else
      r.each { |n| k *= n }
    end

    k
  end

  alias P pi

  # @todo: define operators for combinatorics functions? i.e. *** represents
  #   partial_factorial, n! represents factorial and !n subfactorial..
  def partial_factorial(j, k)
    r = j
    j -= 1
  
    j.downto(k) { |n| r *= n }
  
    r
  end

  def get_fractions(n)
    a = []

    n.downto(1) { |x| a << partial_factorial(n, x) }

    a
  end

  private :partial_factorial, :get_fractions

  # @param [Fixnum] n length of sequence
  # @raise [RangeError] n must be non-negative
  # @return [Fixnum] cardinality of derangements set
  # @example subfactorial([1, 2, 3].size)
  # @see http://mathworld.wolfram.com/Subfactorial.html
  def subfactorial(n)
    if n < 0
      raise(RangeError,'n must be non-negative')
    end

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

  # @param [Fixnum] x positive integer to apply algebraic factorial function to
  # @return [Fixnum] solution to factorial function as a whole number
  # @raise [RangeError] number must be non-negative
  # @example factorial(4)
  # @see http://en.wikipedia.org/wiki/Factorial
  # @note the factorial of zero equals one!
  def factorial(x = 1)
    raise(RangeError, 'x must be non-negative') if x < 0

    if x.zero?
      1
    else
      sigma(1 .. x)
    end
  end
end
