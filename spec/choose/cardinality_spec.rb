require 'spec_helper'
require 'combinatorics/choose'

describe Choose do
  subject { Choose }

  describe "cardinality" do
    it "should raise RangeError if n is negative" do
      lambda { subject.cardinality(-1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if n is negative" do
      lambda { subject.cardinality(-1, 1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if r is negative" do
      lambda { subject.cardinality(1, -1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if r is greater than n" do
      lambda { subject.cardinality(2, 3) }.should raise_error(RangeError)
    end

    it "should return 1 for subject.cardinality(0)" do
      subject.cardinality(0).should == 1
    end

    it "should return 1 for subject.cardinality(1)" do
      subject.cardinality(1).should == 1
    end

    it "should return 2 for subject.cardinality(2)" do
      subject.cardinality(2).should == 2
    end

    it "should return 6 for subject.cardinality(3)" do
      subject.cardinality(3).should == 6
    end

    it "should return 24 for subject.cardinality(4)" do
      subject.cardinality(4).should == 24
    end

    it "should return 0 for subject.cardinality(1, 0)" do
      subject.cardinality(1, 0).should be_zero
    end

    it "should return 1 for subject.cardinality(1, 1)" do
      subject.cardinality(1, 1).should == 1
    end

    it "should return 2 for subject.cardinality(2, 1)" do
      subject.cardinality(2, 1).should == 2
    end

    it "should return 1 for subject.cardinality(2, 2)" do
      subject.cardinality(2, 2).should == 1
    end

    it "should return 3 for subject.cardinality(3, 1)" do
      subject.cardinality(3, 1).should == 3
    end

    it "should return 3 for subject.cardinality(3, 2)" do
      subject.cardinality(3, 2).should == 3
    end

    it "should return 1 for subject.cardinality(3, 3)" do
      subject.cardinality(3, 3).should == 1
    end

    it "should return 4 for subject.cardinality(4, 1)" do
      subject.cardinality(4, 1).should == 4
    end

    it "should return 6 for subject.cardinality(4, 2)" do
      subject.cardinality(4, 2).should == 6
    end

    it "should return 4 for subject.cardinality(4, 3)" do
      subject.cardinality(4, 3).should == 4
    end

    it "should return 1 for subject.cardinality(4, 4)" do
      subject.cardinality(4, 4).should == 1
    end

    it "should return 360 for subject.cardinality(6, 4)" do
      subject.cardinality(6, 4).should == 360
    end

    it "should return 3628800 for subject.cardinality(10)" do
      subject.cardinality(10).should == 3628800
    end
  end

  describe "cardinality_all" do
    it "should return [] for subject.cardinality_all(0)" do
      subject.cardinality_all(0).should be_empty
    end

    it "should return [1] for subject.cardinality_all(1)" do
      subject.cardinality_all(1).should == [1]
    end

    it "should return [2, 1] for subject.cardinality_all(2)" do
      subject.cardinality_all(2).should == [2, 1]
    end

    it "should return [3, 6, 1] for subject.cardinality_all(3)" do
      subject.cardinality_all(3).should == [3, 6, 1]
    end

    it "should return [4, 12, 24, 1] for subject.cardinality_all(4)" do
      subject.cardinality_all(4).should == [4, 12, 24, 1]
    end

    it "should raise RangeError for subject.cardinality_all(-1)" do
      lambda {subject.cardinality_all(-1)}.should raise_error(RangeError)
    end

    it "should wrap cardinality with Choose.C" do
      should respond_to(:C)
    end
  end
end
