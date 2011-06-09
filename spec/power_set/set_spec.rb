require 'spec_helper'
require 'power_set/mixin_examples'

require 'combinatorics/power_set/extensions/set'

describe Set do
  subject { Set }

  it_should_behave_like "PowerSet::Mixin"
end
