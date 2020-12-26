require 'spec_helper'

require 'combinatorics/cartesian_product/mixin'

shared_examples_for "CartesianProduct::Mixin" do
  it "the cartprod of any two Set's should return an Enumerator" do
    set     = subject[1]
    results = set.cartprod(set)

    expect(results).to be_kind_of(Enumerator)
  end

  it "the cartprod of two empty Set's should return an empty Set" do
    set     = subject[]
    results = set.cartprod([]).to_a
    
    expect(results).to be_empty
  end

  it "the cartprod of a single empty set should return an empty Set" do
    set     = subject[1,2]
    results = set.cartprod([2,3],[]).to_a
    
    expect(results).to be_empty
  end

  it "the cartprod of another empty set should also return an empty Set" do
    set     = subject[]
    results = set.cartprod([1]).to_a
    
    expect(results).to be_empty
  end

  it "the cartprod of [1] and [1] should be [[1, 1]]" do
    set     = subject[1]
    results = set.cartprod([1]).to_a
    
    expect(results).to eq([[1, 1]])
  end

  it "the cartprod of [1, 2] and [3] should be [[1, 3], [2, 3]]" do
    set     = subject[1, 2]
    results = set.cartprod([3]).to_a
    
    expect(results).to match_array([[1, 3], [2, 3]])
  end

  it "the cartprod of [1, 2] and [3, 4] should be [[1, 3], [1, 4], [2, 3], [2, 4]]" do
    set     = subject[1, 2]
    results = set.cartprod([3, 4]).to_a
    
    expect(results).to match_array([
      [1, 3], [1, 4],
      [2, 3], [2, 4]
    ])
  end

  it "the cartprod of ['a'].cartprod(['b', 'c', 'd']) should be [['a', 'b'], ['a', 'c'], ['a', 'd']]" do
    set1    = subject['a']
    set2    = subject['b', 'c', 'd']
    results = set1.cartprod(set2).to_a
    
    expect(results).to match_array([['a', 'b'], ['a', 'c'], ['a', 'd']])
  end

  it "the cartprod of [0, 1] and [[2, 3], [4, 5]] should be [[0, 2, 4], [1, 2, 4], [0, 3, 4], [1, 3, 4], [0, 2, 5], [1, 2, 5], [0, 3, 5], [1, 3, 5]]" do
    set1    = subject[0, 1]
    set2    = subject[2, 3]
    set3    = subject[4, 5]
    results = set1.cartprod(set2, set3).to_a
    
    expect(results).to match_array([
      [0, 2, 4], [0, 2, 5], [0, 3, 4], [0, 3, 5],
      [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5],
    ])
  end

  it "should take an optional block argument" do
    set     = subject[1]
    results = []

    set.cartprod(set) { |result| results << result }

    expect(results).to eq([[1, 1]])
  end

  it "should alias cartprod to cartesian_product" do
    aset = subject[1]

    expect(aset).to respond_to(:cartesian_product)
  end

  it "should alias cartprod to cartesian" do
    aset = subject[1]

    expect(aset).to respond_to(:cartesian)
  end
end
