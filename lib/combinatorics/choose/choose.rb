# @author duper <super@manson.vistech.net>

require 'combinatorics/extensions/math'

module Combinatorics
  include Math

  module Choose
    # @param [Fixnum] n the number of elements in the input set
    # @param [Fixnum] r cardinality of subsets to choose
    # @raise [RangeError] n must be non-negative!
    # @raise [RangeError] r must be non-negative!
    # @raise [RangeError] r must be less than or equal to n!
    # @return [Fixnum] the binomial coefficient of "n-choose-r"
    # @example P(6, 4)
    # @see http://en.wikipedia.org/wiki/Binomial_coefficient
    # @note This method's naming convention reflects well-known notation used 
    #       within fields of academic inquiry such as discrete mathematics and
    #       set theory. It represents a function returning an integer value
    #       for the cardinality of a k-combination (i.e. binomial coefficient.)
    def P(n, r = nil) 
      raise RangeError.new('n must be non-negative!') if n < 0
      raise RangeError.new('r must be non-negative!') if r < -1
      raise RangeError.new('r must be less than or equal to n!') if r > n

      if r.nil?
        factorial(n)
      else
        return 0 if r.zero?
        return 1 if n == r

        ret = 1

        n.downto(n - (r - 1)) do |x|
          ret *= x
        end

        ret
      end
    end

    alias cardinality P

    # @param [Fixnum] c input set cardinality
    # @return [Array] elements are cardinalities for each subset 1 .. c
    # @raise [RangeError] c must be non-negative!
    # @example cardinality_all(4)
    # @note sum of elements will equal factorial(c)
    # @see choose
    # @see http://en.wikipedia.org/wiki/Combinations
    def cardinality_all(c)
      raise RangeError.new('c must be non-negative!') if c < 0
      return Array.new() if c.zero?

      ret = [c]

      2.upto(c).map{|x| ret << P(c, x)}

      ret
    end

    alias P_all cardinality_all

    # @param [Array] s the input set
    # @param [Fixnum] k cardinality of subsets to choose
    # @return [Enumerator] k-combinations of s
    # @example choose([1, 2], 1)
    # @see Array#combination
    def choose(s, k)
      return Enumerator.new([[]]) if s.nil? or s.empty?

      s.combination(k)
    end
  end
end

if $0 == __FILE__
  include Combinatorics, Combinatorics::Choose, Math

  puts factorial(10) # 3628800
  puts factorial(1)  # 1
  puts P(6, 4)       # 360
  puts P(1, 0)       # 0
  puts P(1, 1)       # 1

  exit 0
end
