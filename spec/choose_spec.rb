require 'spec_helper'
require 'combinatorics/choose'

include Combinatorics
include Combinatorics::Choose

describe 'Choose' do
  describe 'choose' do
    it 'should return [[]] for choose(nil, 0).to_a' do
      choose(nil, 0).to_a == [[]]
    end

    it 'should return [[]] for choose([], 0).to_a' do
      choose([], 0).to_a == [[]]
    end

    it 'should return [[]] for choose([1], 0).to_a' do
      choose([1], 0).to_a == [[]]
    end

    it 'should return [[1]] for choose([1], 1).to_a' do
      choose([1], 1).to_a == [[1]]
    end

    it 'should return [[1], [2]] for choose([1, 2], 1).to_a' do
      choose([1, 2], 1).to_a == [[1], [2]]
    end

    it 'should return [[1, 2]] for choose([1, 2], 2).to_a' do
      choose([1, 2], 2).to_a == [[1, 2]]
    end
  end

  describe 'C' do
    it 'should raise RangeError if n is negative' do
      lambda {C(-1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if n is negative' do
      lambda {C(-1, 1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is negative' do
      lambda {C(1, -1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is greater than n' do
      lambda {C(2, 3)}.should raise_error(RangeError)
    end

    it 'should return 1 for C(0)' do
      C(0) == 1
    end

    it 'should return 1 for C(1)' do
      C(1) == 1
    end

    it 'should return 2 for C(2)' do
      C(2) == 2
    end

    it 'should return 6 for C(3)' do
      C(3) == 6
    end

    it 'should return 24 for C(4)' do
      C(4) == 24
    end

    it 'should return 0 for C(1, 0)' do
      C(1, 0).zero?
    end

    it 'should return 1 for C(1, 1)' do
      C(1, 1) == 1
    end

    it 'should return 2 for C(2, 1)' do
      C(2, 1) == 2
    end

    it 'should return 1 for C(2, 2)' do
      C(2, 2) == 1
    end

    it 'should return 3 for C(3, 1)' do
      C(3, 1) == 3
    end

    it 'should return 3 for C(3, 2)' do
      C(3, 2) == 3
    end

    it 'should return 1 for C(3, 3)' do
      C(3, 3) == 1
    end

    it 'should return 4 for C(4, 1)' do
      C(4, 1) == 4
    end

    it 'should return 6 for C(4, 2)' do
      C(4, 2) == 6
    end

    it 'should return 4 for C(4, 3)' do
      C(4, 3) == 4
    end

    it 'should return 1 for C(4, 4)' do
      C(4, 4) == 1
    end

    it 'should return 360 for C(6, 4)' do
      C(6, 4) == 360
    end

    it 'should return 3628800 for C(10)' do
      C(10) == 3628800
    end
  end

  describe 'cardinality_all' do
    it 'should return [] for cardinality_all(0)' do
      cardinality_all(0).empty?
    end

    it 'should return [1] for cardinality_all(1)' do
      cardinality_all(1) == [1]
    end

    it 'should return [2, 1] for cardinality_all(2)' do
      cardinality_all(2) == [2, 1]
    end

    it 'should return [3, 6, 1] for cardinality_all(3)' do
      cardinality_all(3) == [3, 6, 1]
    end

    it 'should return [4, 12, 24, 1] for cardinality_all(4)' do
      cardinality_all(4) == [4, 12, 24, 1]
    end

    it 'should raise RangeError for cardinality_all(-1)' do
      lambda {cardinality_all(-1)}.should raise_error(RangeError)
    end

    it 'should alias cardinality to C' do
      should respond_to(:C)
    end

    it 'should alias cardinality to len' do
      should respond_to(:len)
    end

    it 'should alias cardinality_all to C_all' do
      should respond_to(:C_all)
    end

    it 'should alias cardinality_all to len_all' do
      should respond_to(:len_all)
    end
  end
end
