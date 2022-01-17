require 'spec_helper'
require 'permute/mixin_examples'

require 'combinatorics/permute/core_ext/array'

describe Array do
  subject { Array }

  it_should_behave_like "Permute::Mixin"
end
