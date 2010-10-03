require 'spec_helper'
require 'combinatorics/list_comprehension'

describe "Array#comprehension" do
  it "should return an Enumerator object if no block is given" do
    a = [1..5]

    a.comprehension.should_not be_kind_of(Array)
  end

  it "should yield iterations to the given block" do
    range = (1..5)
    a = [range]

    a.comprehension do |values|
      values.should be_kind_of(Array)
      range.should include(values[0])
    end
  end

  it "should do nothing an Array of all non-enumerable objects" do
    a = [1,2,3]

    a.comprehension.to_a.should == [a]
  end

  it "should iterate over the values within an enumerable value" do
    range = (1..10)
    a = [range]

    a.comprehension.each { |values| range.should include(values[0]) }
  end

  it "should ignore non-enumerable values" do
    range = (1..5)
    a = [1,range]

    a.comprehension.each do |values|
      values[0].should == 1
      range.should include(values[1])
    end
  end

  it "should pass through an empty Array" do
    a = []

    a.comprehension.to_a.should == [a]
  end
end
