require 'spec_helper'
require 'combinatorics/derange/cardinality'

describe Derange do
  subject do
    Object.new.extend(Combinatorics::Derange)
  end

  it 'should alias cardinality to subfactorial' do
    should respond_to(:cardinality)
  end

  it 'should alias D to subfactorial' do
    should respond_to(:D)
  end
end
