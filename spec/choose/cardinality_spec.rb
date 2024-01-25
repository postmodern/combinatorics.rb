require 'spec_helper'
require 'combinatorics/choose'

describe Combinatorics::Choose do
  describe "cardinality" do
    it "should raise RangeError if n is negative" do
      expect { subject.cardinality(-1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if n is negative" do
      expect { subject.cardinality(-1, 1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if r is negative" do
      expect { subject.cardinality(1, -1) }.to raise_error(RangeError)
    end

    it "should raise RangeError if r is greater than n" do
      expect { subject.cardinality(2, 3) }.to raise_error(RangeError)
    end

    it "should return 1 for subject.cardinality(0)" do
      expect(subject.cardinality(0)).to eq(1)
    end

    it "should return 1 for subject.cardinality(1)" do
      expect(subject.cardinality(1)).to eq(1)
    end

    it "should return 2 for subject.cardinality(2)" do
      expect(subject.cardinality(2)).to eq(2)
    end

    it "should return 6 for subject.cardinality(3)" do
      expect(subject.cardinality(3)).to eq(6)
    end

    it "should return 24 for subject.cardinality(4)" do
      expect(subject.cardinality(4)).to eq(24)
    end

    it "should return 1 for subject.cardinality(1, 0)" do
      expect(subject.cardinality(1, 0)).to eq(1)
    end

    it "should return 1 for subject.cardinality(1, 1)" do
      expect(subject.cardinality(1, 1)).to eq(1)
    end

    it "should return 2 for subject.cardinality(2, 1)" do
      expect(subject.cardinality(2, 1)).to eq(2)
    end

    it "should return 1 for subject.cardinality(2, 2)" do
      expect(subject.cardinality(2, 2)).to eq(1)
    end

    it "should return 3 for subject.cardinality(3, 1)" do
      expect(subject.cardinality(3, 1)).to eq(3)
    end

    it "should return 3 for subject.cardinality(3, 2)" do
      expect(subject.cardinality(3, 2)).to eq(3)
    end

    it "should return 1 for subject.cardinality(3, 3)" do
      expect(subject.cardinality(3, 3)).to eq(1)
    end

    it "should return 4 for subject.cardinality(4, 1)" do
      expect(subject.cardinality(4, 1)).to eq(4)
    end

    it "should return 6 for subject.cardinality(4, 2)" do
      expect(subject.cardinality(4, 2)).to eq(6)
    end

    it "should return 4 for subject.cardinality(4, 3)" do
      expect(subject.cardinality(4, 3)).to eq(4)
    end

    it "should return 1 for subject.cardinality(4, 4)" do
      expect(subject.cardinality(4, 4)).to eq(1)
    end

    it "should return 15 for subject.cardinality(6, 4)" do
      expect(subject.cardinality(6, 4)).to eq(15)
    end

    it "should return 3628800 for subject.cardinality(10)" do
      expect(subject.cardinality(10)).to eq(3628800)
    end
  end

  describe "cardinality_all" do
    it "should return [] for subject.cardinality_all(0)" do
      expect(subject.cardinality_all(0)).to be_empty
    end

    it "should return [1] for subject.cardinality_all(1)" do
      expect(subject.cardinality_all(1)).to eq([1])
    end

    it "should return [2, 1] for subject.cardinality_all(2)" do
      expect(subject.cardinality_all(2)).to eq([2, 1])
    end

    it "should return [3, 3, 1] for subject.cardinality_all(3)" do
      expect(subject.cardinality_all(3)).to eq([3, 3, 1])
    end

    it "should return [4, 6, 4, 1] for subject.cardinality_all(4)" do
      expect(subject.cardinality_all(4)).to eq([4, 6, 4, 1])
    end

    it "should allow specifying the range of `r` values" do
      expect(subject.cardinality_all(10,5..10)).to eq([
        252, 210, 120, 45, 10, 1
      ])
    end

    it "should raise RangeError for subject.cardinality_all(-1)" do
      expect { subject.cardinality_all(-1) }.to raise_error(RangeError)
    end

    it "should wrap cardinality with Choose.C" do
      should respond_to(:C)
    end
  end
end
