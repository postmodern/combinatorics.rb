require 'spec_helper'
require 'combinatorics/derange/extensions/set'

describe Set do
  subject { Set }

  it_should_behave_like 'Combinatorics::Derange::Mixin'
end
