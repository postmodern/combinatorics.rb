require 'spec_helper'
require 'combinatorics/list_comprehension'

describe "Array#comprehension" do
  it "should return an Enumerator object if no block is given" do
    a = [1..5]

    expect(a.comprehension).not_to be_kind_of(Array)
  end

  it "should yield iterations to the given block" do
    range = (1..5)
    a = [range]

    expect(a.comprehension.to_a).to eq([[1],[2],[3],[4],[5]])
  end

  it "should do nothing an Array of all non-enumerable objects" do
    a = [1,2,3]

    expect(a.comprehension.to_a).to eq([a])
  end

  it "should pass through an empty Array" do
    a = []

    expect(a.comprehension.to_a).to eq([a])
  end

  it "should iterate over the values within an enumerable value" do
    range = (1..5)
    a = [range]

    expect(a.comprehension.to_a).to eq([[1],[2],[3],[4],[5]])
  end

  it "should iterate over repeating values" do
    range = [1,2,3,1,2,4]
    a = [range]

    expect(a.comprehension.to_a).to eq([[1],[2],[3],[1],[2],[4]])
  end

  it "should iterate over values from a generator" do
    a = [Enumerator::Generator.new { |g| 5.times { |i| g.yield i } }]

    expect(a.comprehension.to_a).to eq([[0],[1],[2],[3],[4]])
  end

  it "should iterate over values from a non-repeating generator" do
    multiplier = 0
    a = [
      [1,2],
      Enumerator::Generator.new { |g|
        multiplier += 1
        5.times { |i| g.yield(i * multiplier) }
      }
    ]

    expect(a.comprehension.to_a).to eq([
      [1,0],[1,1],[1,2],[1,3],[1,4],
      [2,0],[2,2],[2,4],[2,6],[2,8]
    ])
  end

  it "should ignore non-enumerable values" do
    range = (1..5)
    a = [1,range]

    expect(a.comprehension.to_a).to eq([[1,1],[1,2],[1,3],[1,4],[1,5]])
  end
end
