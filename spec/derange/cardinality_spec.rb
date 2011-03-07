require 'spec_helper'
require 'combinatorics/derange/cardinality'

include Combinatorics, Combinatorics::Derange

describe Derange do
  it 'should alias cardinality to subfactorial' do
    should respond_to(:cardinality)
  end

  it 'should alias D to subfactorial' do
    should respond_to(:D)
  end
end
