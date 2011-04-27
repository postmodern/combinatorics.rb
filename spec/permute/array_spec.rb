require 'spec_helper'
require 'combinatorics/permute/array_extension'
require 'permute/mixin_examples'

describe Array do
  subject { Array }

  it_should_behave_like Permute::Mixin
end
