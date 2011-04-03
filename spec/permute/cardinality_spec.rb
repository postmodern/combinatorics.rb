require 'spec_helper'
require 'combinatorics/permute'

describe 'Permute' do
  subject { Object.new.extend(Permute) }

  it 'should alias cardinality_all to P_all' do
    subject.should respond_to(:P_all)
  end

  it 'should alias cardinality_all to len_all' do
    subject.should respond_to(:len_all)
  end

  describe 'P' do
    it 'should raise RangeError if n is negative' do
      lambda {
        subject.P(-1)
      }.should raise_error(RangeError)
    end

    it 'should raise RangeError if n is negative' do
      lambda {
        subject.P(-1, 1)
      }.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is negative' do
      lambda {
        subject.P(1, -1)
      }.should raise_error(RangeError)
    end

    it 'should raise RangeError if r is greater than n' do
      lambda {
        subject.P(2, 3)
      }.should raise_error(RangeError)
    end

    it 'should return 1 for P(0)' do
      subject.P(0).should == 1
    end

    it 'should return 1 for P(1)' do
      subject.P(1).should == 1
    end

    it 'should return 2 for P(2)' do
      subject.P(2).should == 2
    end

    it 'should return 6 for P(3)' do
      subject.P(3).should == 6
    end

    it 'should return 24 for P(4)' do
      subject.P(4).should == 24
    end

    it 'should return 0 for P(1, 0)' do
      subject.P(1, 0).should be_zero
    end

    it 'should return 1 for P(1, 1)' do
      subject.P(1, 1).should == 1
    end

    it 'should return 2 for P(2, 1)' do
      subject.P(2, 1).should == 2
    end

    it 'should return 1 for P(2, 2)' do
      subject.P(2, 2).should == 1
    end

    it 'should return 3 for P(3, 1)' do
      subject.P(3, 1).should == 3
    end

    it 'should return 3 for P(3, 2)' do
      subject.P(3, 2).should == 3
    end

    it 'should return 1 for P(3, 3)' do
      subject.P(3, 3).should == 1
    end

    it 'should return 4 for P(4, 1)' do
      subject.P(4, 1).should == 4
    end

    it 'should return 6 for P(4, 2)' do
      subject.P(4, 2).should == 6
    end

    it 'should return 4 for P(4, 3)' do
      subject.P(4, 3).should == 4
    end

    it 'should return 1 for P(4, 4)' do
      subject.P(4, 4).should == 1
    end

    it 'should return 360 for P(6, 4)' do
      subject.P(6, 4).should == 360
    end

    it 'should return 3628800 for P(10)' do
      subject.P(10).should == 3628800
    end
  end

  describe 'cardinality_all' do
    it 'should return [] for cardinality_all(0)' do
      subject.cardinality_all(0).should be_empty
    end

    it 'should return [1] for cardinality_all(1)' do
      subject.cardinality_all(1).should == [1]
    end

    it 'should return [2, 1] for cardinality_all(2)' do
      subject.cardinality_all(2).should == [2, 1]
    end

    it 'should return [3, 6, 1] for cardinality_all(3)' do
      subject.cardinality_all(3).should == [3, 6, 1]
    end

    it 'should return [4, 12, 24, 1] for cardinality_all(4)' do
      subject.cardinality_all(4).should == [4, 12, 24, 1]
    end

    it 'should raise RangeError for cardinality_all(-1)' do
      lambda {
        subject.cardinality_all(-1)
      }.should raise_error(RangeError)
    end
  end
end
