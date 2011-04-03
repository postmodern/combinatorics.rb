require 'spec_helper'
require 'combinatorics/extensions/math'

describe Math do
  describe 'sigma' do
    it 'should return 6 for sigma(1..3)' do
      subject.sigma(1..3) == 6
    end

    it 'should return 60 for sigma(3..5)' do
      subject.sigma(3..5) == 60
    end

    it 'should take an optional block argument' do
      arange = 1..1
      aproc = lambda {|x| x}
      ares = subject.sigma(arange, &aproc)

      ares.should == 1
    end

    it 'should alias S to sigma' do
      should respond_to(:S)
    end
  end

  describe 'pi' do
    it 'should return 24 for pi(1..4)' do
      subject.pi(1..4) == 24
    end

    it 'should return 30 for pi(5..6)' do
      subject.pi(5..6) == 30
    end

    it 'should take an optional block argument' do
      arange = 1..1
      aproc = lambda {|x| x}
      ares = subject.pi(arange, &aproc)

      ares.should == 0
    end

    it 'should alias P to pi' do
      should respond_to(:P)
    end
  end

  describe 'factorial' do
    it 'should return 1 for factorial(0)' do
      subject.factorial(0) == 1
    end

    it 'should return 1 for factorial(1)' do
      subject.factorial(1) == 1
    end

    it 'should return 2 for factorial(2)' do
      subject.factorial(2) == 2
    end

    it 'should return 6 for factorial(3)' do
      subject.factorial(3) == 6
    end
    
    it 'should return 3628800 for factorial(10)' do
      subject.factorial(10) == 3628800
    end

    it 'should raise RangeError for factorial(-1)' do
      lambda {
        subject.factorial(-1)
      }.should raise_error(RangeError)
    end
  end

  describe 'subfactorial' do
    it 'should return 1 for subfactorial(0)' do
      subject.subfactorial(0) == 1
    end

    it 'should return 0 for subfactorial(1)' do
      subject.subfactorial(1).zero?
    end

    it 'should return 1 for subfactorial(2)' do
      subject.subfactorial(2) == 1
    end

    it 'should return 2 for subfactorial(3)' do
      subject.subfactorial(3) == 2
    end

    it 'should return 9 for subfactorial(4)' do
      subject.subfactorial(4) == 9
    end

    it 'should return 44 for subfactorial(5)' do
      subject.subfactorial(5) == 4
    end

    it 'should raise RangeError for subfactorial(-1)' do
      lambda {
        subject.subfactorial(-1)
      }.should raise_error(RangeError)
    end
  end
end
