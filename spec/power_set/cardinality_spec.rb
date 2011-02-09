require 'spec_helper'
require 'combinatorics/power_set'

describe PowerSet do
  subject { Object.new.extend(PowerSet) }

  describe 'cardinality' do
    it 'should return 1 for cardinality(0)' do 
      subject.cardinality(0) == 1
    end

    it 'should return 1 for cardinality(1)' do
      subject.cardinality(1) == 1
    end

    it 'should return 2 for cardinality(2)' do
      subject.cardinality(2) == 2
    end

    it 'should return 6 for cardinality(3)' do
      subject.cardinality(3) == 6
    end

    it 'should return 24 for cardinality(4)' do
      subject.cardinality(4) == 24
    end
  end

  it 'should alias cardinality to len' do
    should respond_to(:len)
  end
end
