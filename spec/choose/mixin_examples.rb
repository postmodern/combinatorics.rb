require 'spec_helper'
require 'combinatorics/choose'

shared_examples_for "Choose::Mixin" do
  let(:empty_set) { Set[] }

  it "should return [[]] for [].choose(0).to_a" do
    set     = subject[]
    results = set.choose(0).to_a

    results.should == [empty_set]
  end

  it "should return [[]] for [1].choose(0).to_a" do
    set     = subject[1]
    results = set.choose(0).to_a
    
    results.should == [empty_set]
  end

  it "should return [[1]] for [1].choose(1).to_a" do
    set     = subject[1]
    results = set.choose(1).to_a
    
    results.should == [Set[1]]
  end

  it "should return [[1], [2]] for [1, 2].choose(1).to_a" do
    set     = subject[1, 2]
    results = set.choose(1).to_a
    
    results.should =~ [Set[1], Set[2]]
  end

  it "should return [[1, 2]] for [1, 2].choose(2).to_a" do
    set     = subject[1, 2]
    results = set.choose(2).to_a
    
    results.should == [Set[1, 2]]
  end

  it "should filter out repeated elements" do
    set1 = subject[1,1,2,3]
    set2 = subject[1,2,3]

    set1.choose(2).to_a.should == set2.choose(2).to_a
  end
end
