require 'spec_helper'
require 'combinatorics/choose/core_ext/array'
require 'choose/mixin_examples'

describe Array do
  subject { Array }

  it_should_behave_like 'Choose::Mixin'
end
