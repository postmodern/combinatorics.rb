require 'spec_helper'
require 'combinatorics/cartesian_product'

describe Combinatorics::CartesianProduct do
  describe "cardinality" do
    it "should return 1 for cardinality(1, 1)" do 
      expect(subject.cardinality(1, 1)).to eq(1)
    end

    it "should return 2 for cardinality(1, 2)" do
      expect(subject.cardinality(1, 2)).to eq(2)
    end

    it "should return 2 for cardinality(2, 1)" do
      expect(subject.cardinality(2, 1)).to eq(2)
    end

    it "should return 4 for cardinality(2, 2)" do
      expect(subject.cardinality(2, 2)).to eq(4)
    end

    it "should return 3 for cardinality(3, 1)" do
      expect(subject.cardinality(3, 1)).to eq(3)
    end

    it "should return 3 for cardinality(1, 3)" do
      expect(subject.cardinality(1, 3)).to eq(3)
    end

    it "should return 6 for cardinality(2, 3)" do
      expect(subject.cardinality(2, 3)).to eq(6)
    end

    it "should return 6 for cardinality(3, 2)" do
      expect(subject.cardinality(3, 2)).to eq(6)
    end
    
    it "should return 9 for cardinality(3, 3)" do
      expect(subject.cardinality(3, 3)).to eq(9)
    end

    it "should raise RangeError if c1 is negative" do
      expect { subject.cardinality(-1, 1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if c2 is negative" do
      expect { subject.cardinality(1, -1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if c1 is zero" do
      expect { subject.cardinality(0, 1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if c2 is zero" do
      expect { subject.cardinality(1, 0) }.to raise_error(RangeError)
    end
  end

  it "should wrap cardinality with CartesianProduct.X" do
    should respond_to(:X)
  end
end
