require 'spec_helper'
require 'combinatorics/power_set/extensions/set'
require 'power_set/mixin_examples'

describe Set do
  subject { Set }

  it_should_behave_like PowerSet::Mixin
end
