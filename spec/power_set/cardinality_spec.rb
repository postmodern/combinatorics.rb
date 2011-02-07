require 'spec_helper'
require 'combinatorics/power_set'

include Combinatorics::PowerSet

describe 'PowerSet' do
  describe 'cardinality' do
    it 'should return 1 for cardinality(0)' do 
      cardinality(0) == 1
    end

    it 'should return 1 for cardinality(1)' do
      cardinality(1) == 1
    end

    it 'should return 2 for cardinality(2)' do
      cardinality(2) == 2
    end

    it 'should return 6 for cardinality(3)' do
      cardinality(3) == 6
    end

    it 'should reutrn 24 for cardinality(4)' do
      cardinality(4) == 24
    end

    it 'should alias cardinality to len' do
      should respond_to(:len)
    end
  end
end
