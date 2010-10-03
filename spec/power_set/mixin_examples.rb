shared_examples_for "Combinatorics::PowerSet::Mixin" do
  it "the powerset of an empty Set should only contain the empty Set" do
    set = subject[]

    set.powerset.should == [set]
  end

  it "the powerset of a single Set should contain that Set" do
    set = subject[1]

    set.powerset.should == [subject[], set]
  end

  it "the powerset of a Set should all be subsets" do
    set = subject[1,2,3]

    set.powerset.each { |subset| (set & subset).should == subset }
  end

  it "should alias cartesian_product to powerset" do
    set = subject[1,2,3]

    set.cartesian_product.should == set.powerset
  end
end
