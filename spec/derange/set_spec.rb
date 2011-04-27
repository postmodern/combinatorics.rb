require 'spec_helper'
require 'derange/mixin_examples'
require 'combinatorics/derange/extensions/set'

describe Set do
  subject { Set }

  it_should_behave_like Derange::Mixin
end
