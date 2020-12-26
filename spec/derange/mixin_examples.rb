require 'spec_helper'

require 'combinatorics/derange'

shared_examples_for "Derange::Mixin" do
  it "the derange of an empty Set should only contain an empty Array" do
    set     = subject[]
    results = set.derange.to_a
    
    expect(results).to eq([[]])
  end

  it "should return [[]] for [1].derange.to_a" do
    set     = subject[1]
    results = set.derange.to_a

    expect(results).to eq([[]])
  end

  it "should return [[2, 1]] for [1, 2].derange.to_a" do
    set     = subject[1, 2]
    results = set.derange.to_a

    expect(results).to eq([[2, 1]])
  end

  it "should return [[2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3], [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1], [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1]] for [1, 2, 3, 4].derange.to_a" do
    set     = [1, 2, 3, 4]
    results = set.derange.to_a
    
    expect(results).to eq([
      [2, 1, 4, 3],
      [2, 3, 4, 1],
      [2, 4, 1, 3],
      [3, 1, 4, 2],
      [3, 4, 1, 2],
      [3, 4, 2, 1],
      [4, 1, 2, 3],
      [4, 3, 1, 2],
      [4, 3, 2, 1]
    ])
  end

  it "should take an optional block argument" do
    set     = subject[1, 2, 3]
    results = []

    set.derange { |deranged| results << deranged }

    expect(results).to eq([[2, 3, 1], [3, 1, 2]])
  end
end
