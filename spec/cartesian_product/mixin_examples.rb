shared_examples_for 'Combinatorics::CartesianProduct::Mixin' do
  it "the cartprod of two empty Set's should return an empty Set" do
    set = subject[]

    set.cartprod([]).empty?
  end

  it 'the cartprod of a single empty set should return an empty Set' do
    set = subject[1]

    set.cartprod([]).empty?
  end

  it 'the cartprod of another empty set should also return an empty Set' do
    set = subject[]

    set.cartprod([1]).empty?
  end

  it 'the cartprod of [1] and [1] should be [[1, 1]]' do
    set = subject[1]

    set.cartprod([1]) == [[1, 1]]
  end

  it 'the cartprod of [1, 2] and [3] should be [[1, 3], [2, 3]]' do
    set = subject[1, 2]

    set.cartprod([3]) == [[1, 3], [2, 3]]
  end

  it 'the cartprod of [1, 2] and [3, 4] should be [[1, 3], [1, 4], [2, 3], [2, 4]]' do
    set = [1, 2]

    set.cartprod([3, 4]) == [[1, 3], [1, 4], [2, 3], [2, 4]]
  end

  ###
  # @todo: nested cartesian product argument test cases
  ###

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
