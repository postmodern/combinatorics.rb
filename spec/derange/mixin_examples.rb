require 'spec_helper'
require 'combinatorics/derange'

shared_examples_for 'Combinatorics::Derange::Mixin' do
  it 'the derange of an empty Set should only contain an empty Array' do
    aset = subject[]

    aset.derange.to_a.should == [[]]
  end

  it 'should return [[]] for [1].derange.to_a' do
    [1].derange.to_a.should == [[]]
  end

  it 'should return [[2, 1]] for [1, 2].derange.to_a' do
    [1, 2].derange.to_a.should == [[2, 1]]
  end

  it 'should return [[2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1]] for [1, 2, 3, 4].derange.to_a' do
    [1, 2, 3, 4].derange.to_a.should == [[2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1]]
  end

  it 'should take an optional block argument' do
    aset = subject[1, 2, 3]
    ares = []

    aset.derange { |aderange| ares << aderange }

    ares.should == [[2, 3, 1], [3, 1, 2]]
  end
end
