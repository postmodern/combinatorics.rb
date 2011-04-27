require 'spec_helper'
require 'combinatorics/power_set/extensions/array'
require 'power_set/mixin_examples'

describe Array do
  subject { Array }

  it_should_behave_like PowerSet::Mixin
end
