require 'spec_helper'

require 'combinatorics/power_set'

shared_examples_for "PowerSet::Mixin" do
  let(:empty_set) { Set[] }

  it "the powerset of an empty Set should only contain the empty Set" do
    set = subject[]

    expect(set.powerset.to_a).to eq([empty_set])
  end

  it "the powerset of a single Set should contain that Set" do
    set = subject[1]

    expect(set.powerset.to_a).to eq([empty_set, Set[*set]])
  end

  it "the powerset of a Set should all be subsets" do
    set = subject[1, 2, 3]
    superset = Set[]

    set.powerset { |subset| superset += subset }

    expect(superset).to eq(Set[*set])
  end

  it "should alias powerset to power_set" do
    set = subject[1]

    expect(set).to respond_to(:power_set)
  end
end
