require 'spec_helper'
require 'combinatorics/permute'

include Combinatorics, Combinatorics::Permute

describe 'Permute' do
  subject { Object.new.extend(Permute) }

  describe 'P' do
    it 'should raise RangeError if n is negative' do
      lambda {P(-1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if n is negative' do
      lambda {P(-1, 1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is negative' do
      lambda {P(1, -1)}.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is greater than n' do
      lambda {P(2, 3)}.should raise_error(RangeError)
    end

    it 'should return 1 for P(0)' do
      P(0) == 1
    end

    it 'should return 1 for P(1)' do
      P(1) == 1
    end

    it 'should return 2 for P(2)' do
      P(2) == 2
    end

    it 'should return 6 for P(3)' do
      P(3) == 6
    end

    it 'should return 24 for P(4)' do
      P(4) == 24
    end

    it 'should return 0 for P(1, 0)' do
      P(1, 0).zero?
    end

    it 'should return 1 for P(1, 1)' do
      P(1, 1) == 1
    end

    it 'should return 2 for P(2, 1)' do
      P(2, 1) == 2
    end

    it 'should return 1 for P(2, 2)' do
      P(2, 2) == 1
    end

    it 'should return 3 for P(3, 1)' do
      P(3, 1) == 3
    end

    it 'should return 3 for P(3, 2)' do
      P(3, 2) == 3
    end

    it 'should return 1 for P(3, 3)' do
      P(3, 3) == 1
    end

    it 'should return 4 for P(4, 1)' do
      P(4, 1) == 4
    end

    it 'should return 6 for P(4, 2)' do
      P(4, 2) == 6
    end

    it 'should return 4 for P(4, 3)' do
      P(4, 3) == 4
    end

    it 'should return 1 for P(4, 4)' do
      P(4, 4) == 1
    end

    it 'should return 360 for P(6, 4)' do
      P(6, 4) == 360
    end

    it 'should return 3628800 for P(10)' do
      P(10) == 3628800
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

    it 'should alias cardinality_all to P_all' do
      should respond_to(:P_all)
    end

    it 'should alias cardinality_all to len_all' do
      should respond_to(:len_all)
    end
  end
end
