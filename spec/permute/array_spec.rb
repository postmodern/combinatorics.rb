require 'spec_helper'
require 'permute/mixin_examples'

require 'combinatorics/permute/array_extension'

describe Array do
  subject { Array }

  it_should_behave_like "Permute::Mixin"
end
