require 'spec_helper'
require 'combinatorics/derange/cardinality'

describe Derange do
  subject { Derange }

  it "should alias cardinality to subfactorial" do
    should respond_to(:cardinality)
  end

  it "should wrap subfactorial with Derange.D" do
    should respond_to(:D)
  end
end
