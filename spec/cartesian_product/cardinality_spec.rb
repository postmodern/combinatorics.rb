require 'spec_helper'
require 'combinatorics/cartesian_product'

describe CartesianProduct do
  subject  {  Object.new.extend(CartesianProduct)  } 

  describe "cardinality" do
    it "should return 1 for cardinality(1, 1)" do 
      subject.cardinality(1, 1).should == 1
    end

    it "should return 2 for cardinality(1, 2)" do
      subject.cardinality(1, 2).should == 2
    end

    it "should return 2 for cardinality(2, 1)" do
      subject.cardinality(2, 1).should == 2
    end

    it "should return 4 for cardinality(2, 2)" do
      subject.cardinality(2, 2).should == 4
    end

    it "should return 3 for cardinality(3, 1)" do
      subject.cardinality(3, 1).should == 3
    end

    it "should return 3 for cardinality(1, 3)" do
      subject.cardinality(1, 3).should == 3
    end

    it "should return 6 for cardinality(2, 3)" do
      subject.cardinality(2, 3).should == 6
    end

    it "should return 6 for cardinality(3, 2)" do
      subject.cardinality(3, 2).should == 6
    end
    
    it "should return 9 for cardinality(3, 3)" do
      subject.cardinality(3, 3).should == 9
    end

    it "should raise RangeError if c1 is negative" do
      lambda { subject.cardinality(-1, 1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if c2 is negative" do
      lambda { subject.cardinality(1, -1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if c1 is zero" do
      lambda { subject.cardinality(0, 1) }.should raise_error(RangeError)
    end

    it "should raise RangeError if c2 is zero" do
      lambda { subject.cardinality(1, 0) }.should raise_error(RangeError)
    end
  end

  it "should alias cardinality to len" do
    subject.should respond_to(:len)
  end

  it "should wrap cardinality with CartesianProduct.X" do
    CartesianProduct.should respond_to(:X)
  end
end
