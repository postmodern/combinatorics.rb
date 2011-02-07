shared_examples_for 'Combinatorics::CartesianProduct::Mixin' do
  it "the cartprod of any two Set's should return an Enumerator" do
    result = subject[].cartprod(subject[])

    result.should.is_a?(Enumerator)
  end

  it "the cartprod of two empty Set's should return an empty Set" do
    set = subject[]

    set.cartprod([]).to_a.empty?
  end

  it 'the cartprod of a single empty set should return an empty Set' do
    set = subject[1]

    set.cartprod([]).to_a.empty?
  end

  it 'the cartprod of another empty set should also return an empty Set' do
    set = subject[]

    set.cartprod([1]).to_a.empty?
  end

  it 'the cartprod of [1] and [1] should be [[1, 1]]' do
    set = subject[1]

    set.cartprod([1]).to_a == [[1, 1]]
  end

  it 'the cartprod of [1, 2] and [3] should be [[1, 3], [2, 3]]' do
    set = subject[1, 2]

    set.cartprod([3]).to_a == [[1, 3], [2, 3]]
  end

  it 'the cartprod of [1, 2] and [3, 4] should be [[1, 3], [1, 4], [2, 3], [2, 4]]' do
    set = [1, 2]

    set.cartprod([3, 4]).to_a == [[1, 3], [1, 4], [2, 3], [2, 4]]
  end

  it 'the cartprod of [0, 1] and [[2, 3], [4, 5]] should be [[0, 2, 4], [1, 2, 4], [0, 3, 4], [1, 3, 4], [0, 2, 5], [1, 2, 5], [0, 3, 5], [1, 3, 5]]' do
    set1 = [0, 1]
    set2 = [2, 3]
    set3 = [4, 5]

    set1.cartprod([set2, set3]).to_a == [[0, 2, 4], [1, 2, 4], [0, 3, 4], [1, 3, 4], [0, 2, 5]]
  end

  it 'should take an optional block argument' do
    aset = subject[1]
    aproc = lambda { |x| x }
    ares = aset.cartprod(aset, &aproc)

    ares.to_a.should == [[1, 1]]
  end

  it 'should alias cartprod to cartesian_product' do
    set = [1]

    set.should respond_to(:cartesian_product)
  end

  it 'should alias cartprod to cartesianproduct' do
    set = [1]

    set.should respond_to(:cartesianproduct)
  end

  it 'should alias cartprod to cartesian' do
    set = [1]

    set.should respond_to(:cartesian)
  end
end
