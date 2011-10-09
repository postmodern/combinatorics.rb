require 'spec_helper'
require 'combinatorics/choose'

shared_examples_for "Choose::Mixin" do
  it "should return [[]] for [].choose(0).to_a" do
    set     = subject[[]]
    results = set.choose(0).to_a

    results.should == [[]]
  end

  it "should return [[]] for [1].choose(0).to_a" do
    set     = subject[[1]]
    results = set.choose(0).to_a
    
    results.should == [[]]
  end

  it "should return [[1]] for [1].choose(1).to_a" do
    set     = subject[1]
    results = set.choose(1).to_a
    
    results.should == [[1]]
  end

  it "should return [[1], [2]] for [1, 2].choose(1).to_a" do
    set     = subject[[1, 2]]
    results = set.choose(1).to_a
    
    results.should == [[1], [2]]
  end

  it "should return [[1, 2]] for [1, 2].choose(2).to_a" do
    set     = subject[[1, 2]]
    results = set.choose(2).to_a
    
    results.should == [[1, 2]]
  end

  it "should alias choose to combos" do
    set = subject[1]

    set.should respond_to(:combos) 
  end
end
