require 'spec_helper'

require 'combinatorics/power_set'

shared_examples_for "PowerSet::Mixin" do
  let(:empty_set) { Set[] }

  it "the powerset of an empty Set should only contain the empty Set" do
    set = subject[]

    set.powerset.to_a.should == [empty_set]
  end

  it "the powerset of a single Set should contain that Set" do
    set = subject[1]

    set.powerset.to_a.should == [empty_set, Set[*set]]
  end

  it "the powerset of a Set should all be subsets" do
    set = subject[1, 2, 3]
    superset = Set[]

    set.powerset { |subset| superset += subset }

    superset.should == Set[*set]
  end

  it "should alias powerset to power_set" do
    set = subject[1]

    set.should respond_to(:power_set)
  end
end
