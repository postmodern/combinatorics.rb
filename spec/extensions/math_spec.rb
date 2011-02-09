require 'spec_helper'
require 'combinatorics/extensions/math'

include Math

describe Math do
  describe 'sigma' do
    it 'should return 6 for sigma(1..3)' do
      sigma(1..3) == 6
    end

    it 'should return 60 for sigma(3..5)' do
      sigma(3..5) == 60
    end

    it 'should take an optional block argument' do
      arange = 1..1
      aproc = lambda {|x| x}
      ares = sigma(arange, &aproc)

      ares.should == 1
    end

    it 'should alias S to sigma' do
      should respond_to(:S)
    end
  end

  describe 'pi' do
    it 'should return 24 for pi(1..4)' do
      pi(1..4) == 24
    end

    it 'should return 30 for pi(5..6)' do
      pi(5..6) == 30
    end

    it 'should take an optional block argument' do
      arange = 1..1
      aproc = lambda {|x| x}
      ares = pi(arange, &aproc)

      ares.should == 0
    end

    it 'should alias P to pi' do
      should respond_to(:P)
    end
  end

  describe 'factorial' do
    it 'should return 1 for factorial(0)' do
      factorial(0) == 1
    end

    it 'should return 1 for factorial(1)' do
      factorial(1) == 1
    end

    it 'should return 2 for factorial(2)' do
      factorial(2) == 2
    end

    it 'should return 6 for factorial(3)' do
      factorial(3) == 6
    end
    
    it 'should return 3628800 for factorial(10)' do
      factorial(10) == 3628800
    end

    it 'should raise RangeError for factorial(-1)' do
      lambda {factorial(-1)}.should raise_error(RangeError)
    end
  end

  describe 'subfactorial' do
    it 'should return 1 for subfactorial(0)' do
      subfactorial(0) == 1
    end

    it 'should return 0 for subfactorial(1)' do
      subfactorial(1).zero?
    end

    it 'should return 1 for subfactorial(2)' do
      subfactorial(2) == 1
    end

    it 'should return 2 for subfactorial(3)' do
      subfactorial(3) == 2
    end

    it 'should return 9 for subfactorial(4)' do
      subfactorial(4) == 9
    end

    it 'should return 44 for subfactorial(5)' do
      subfactorial(5) == 4
    end

    it 'should raise RangeError for subfactorial(-1)' do
      lambda {subfactorial(-1)}.should raise_error(RangeError)
    end
  end
end
