require 'spec_helper'
require 'combinatorics/derange/cardinality'

describe Derange do
  subject { Object.new.extend(Derange) }

  it "should alias cardinality to subfactorial" do
    should respond_to(:cardinality)
  end

  it "should alias cardinality to len" do
    should respond_to(:len)
  end

  it "should wrap subfactorial with Derange.D" do
    Derange.should respond_to(:D)
  end
end
