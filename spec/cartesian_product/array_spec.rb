require 'spec_helper'
require 'cartesian_product/mixin_examples'

require 'combinatorics/cartesian_product/extensions/array'

describe Array do
  subject { Array }

  it_should_behave_like "CartesianProduct::Mixin"
end
