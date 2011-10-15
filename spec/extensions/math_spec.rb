require 'spec_helper'
require 'combinatorics/extensions/math'

describe Math do
  it "should alias Sigma to sigma" do
    should respond_to(:Sigma)
  end

  it "should alias Pi to pi" do
    should respond_to(:Pi)
  end

  describe "sigma" do
    it "should return 6 for sigma(1..3)" do
      subject.sigma(1..3).should == 6
    end

    it "should return 60 for sigma(3..5)" do
      subject.sigma(3..5).should == 12
    end

    it "should take an optional block argument" do
      result = subject.sigma(1..5) { |i| i * 2 }

      result.should == (1 * 2) + (2 * 2) + (3 * 2) + (4 * 2) + (5 * 2)
    end
  end

  describe "pi" do
    it "should return 24 for pi(1..4)" do
      subject.pi(1..4).should == 24
    end

    it "should return 30 for pi(5..6)" do
      subject.pi(5..6).should == 30
    end

    it "should take an optional block argument" do
      result = subject.pi(1..3) { |i| i * 2 }

      result.should == (1 * 2) * (2 * 2) * (3 * 2)
    end
  end

  describe "factorial" do
    it "should return 1 for factorial(0)" do
      subject.factorial(0).should == 1
    end

    it "should return 1 for factorial(1)" do
      subject.factorial(1).should == 1
    end

    it "should return 2 for factorial(2)" do
      subject.factorial(2).should == 2
    end

    it "should return 6 for factorial(3)" do
      subject.factorial(3).should == 6
    end
    
    it "should return 3628800 for factorial(10)" do
      subject.factorial(10).should == 3628800
    end

    it "should raise RangeError for factorial(-1)" do
      lambda { subject.factorial(-1) }.should raise_error(RangeError)
    end
  end

  describe "subfactorial" do
    it "should return 1 for subfactorial(0)" do
      subject.subfactorial(0).should == 1
    end

    it "should return 0 for subfactorial(1)" do
      subject.subfactorial(1).should == 0
    end

    it "should return 1 for subfactorial(2)" do
      subject.subfactorial(2).should == 1
    end

    it "should return 2 for subfactorial(3)" do
      subject.subfactorial(3).should == 2
    end

    it "should return 9 for subfactorial(4)" do
      subject.subfactorial(4).should == 9
    end

    it "should return 44 for subfactorial(5)" do
      subject.subfactorial(5).should == 44
    end

    it "should raise RangeError for subfactorial(-1)" do
      lambda { subject.subfactorial(-1) }.should raise_error(RangeError)
    end
  end
end
