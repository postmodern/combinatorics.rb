require 'spec_helper'
require 'combinatorics/list_comprehension'
require 'combinatorics/generator'

describe "Array#comprehension" do
  it "should return an Enumerator object if no block is given" do
    a = [1..5]

    a.comprehension.should_not be_kind_of(Array)
  end

  it "should yield iterations to the given block" do
    range = (1..5)
    a = [range]

    a.comprehension.to_a.should == [[1],[2],[3],[4],[5]]
  end

  it "should do nothing an Array of all non-enumerable objects" do
    a = [1,2,3]

    a.comprehension.to_a.should == [a]
  end

  it "should pass through an empty Array" do
    a = []

    a.comprehension.to_a.should == [a]
  end

  it "should iterate over the values within an enumerable value" do
    range = (1..5)
    a = [range]

    a.comprehension.to_a.should == [[1],[2],[3],[4],[5]]
  end

  it "should iterate over repeating values" do
    range = [1,2,3,1,2,4]
    a = [range]

    a.comprehension.to_a.should == [[1],[2],[3],[1],[2],[4]]
  end

  it "should iterate over values from a generator" do
    a = [Combinatorics::Generator.new { |g| 5.times { |i| g.yield i } }]

    a.comprehension.to_a.should == [[0],[1],[2],[3],[4]]
  end

  it "should iterate over values from a non-repeating generator" do
    multiplier = 0
    a = [
      [1,2],
      Combinatorics::Generator.new { |g|
        multiplier += 1
        5.times { |i| g.yield (i * multiplier) }
      }
    ]

    a.comprehension.to_a.should == [
      [1,0],[1,1],[1,2],[1,3],[1,4],
      [2,0],[2,2],[2,4],[2,6],[2,8]
    ]
  end

  it "should ignore non-enumerable values" do
    range = (1..5)
    a = [1,range]

    a.comprehension.to_a.should == [[1,1],[1,2],[1,3],[1,4],[1,5]]
  end
end
