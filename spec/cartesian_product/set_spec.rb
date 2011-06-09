require 'spec_helper'
require 'cartesian_product/mixin_examples'

require 'combinatorics/cartesian_product/extensions/set'

describe Set do
  subject { Set }

  it_should_behave_like "CartesianProduct::Mixin"
end
