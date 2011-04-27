require 'spec_helper'
require 'combinatorics/choose/extensions/array'
require 'choose/mixin_examples'

describe Array do
  subject { Array }

  it_should_behave_like 'Choose::Mixin'
end
