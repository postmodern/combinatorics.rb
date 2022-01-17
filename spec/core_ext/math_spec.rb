require 'spec_helper'
require 'combinatorics/core_ext/math'

describe Math do
  it "should alias Sigma to sigma" do
    should respond_to(:Sigma)
  end

  it "should alias Pi to pi" do
    should respond_to(:Pi)
  end

  describe "sigma" do
    it "should return 6 for sigma(1..3)" do
      expect(subject.sigma(1..3)).to eq(6)
    end

    it "should return 60 for sigma(3..5)" do
      expect(subject.sigma(3..5)).to eq(12)
    end

    it "should take an optional block argument" do
      result = subject.sigma(1..5) { |i| i * 2 }

      expect(result).to eq((1 * 2) + (2 * 2) + (3 * 2) + (4 * 2) + (5 * 2))
    end
  end

  describe "pi" do
    it "should return 24 for pi(1..4)" do
      expect(subject.pi(1..4)).to eq(24)
    end

    it "should return 30 for pi(5..6)" do
      expect(subject.pi(5..6)).to eq(30)
    end

    it "should take an optional block argument" do
      result = subject.pi(1..3) { |i| i * 2 }

      expect(result).to eq((1 * 2) * (2 * 2) * (3 * 2))
    end
  end

  describe "factorial" do
    it "should return 1 for factorial(0)" do
      expect(subject.factorial(0)).to eq(1)
    end

    it "should return 1 for factorial(1)" do
      expect(subject.factorial(1)).to eq(1)
    end

    it "should return 2 for factorial(2)" do
      expect(subject.factorial(2)).to eq(2)
    end

    it "should return 6 for factorial(3)" do
      expect(subject.factorial(3)).to eq(6)
    end
    
    it "should return 3628800 for factorial(10)" do
      expect(subject.factorial(10)).to eq(3628800)
    end

    it "should raise RangeError for factorial(-1)" do
      expect { subject.factorial(-1) }.to raise_error(RangeError)
    end
  end

  describe "subfactorial" do
    it "should return 1 for subfactorial(0)" do
      expect(subject.subfactorial(0)).to eq(1)
    end

    it "should return 0 for subfactorial(1)" do
      expect(subject.subfactorial(1)).to eq(0)
    end

    it "should return 1 for subfactorial(2)" do
      expect(subject.subfactorial(2)).to eq(1)
    end

    it "should return 2 for subfactorial(3)" do
      expect(subject.subfactorial(3)).to eq(2)
    end

    it "should return 9 for subfactorial(4)" do
      expect(subject.subfactorial(4)).to eq(9)
    end

    it "should return 44 for subfactorial(5)" do
      expect(subject.subfactorial(5)).to eq(44)
    end

    it "should raise RangeError for subfactorial(-1)" do
      expect { subject.subfactorial(-1) }.to raise_error(RangeError)
    end
  end
end
