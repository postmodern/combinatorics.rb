require 'spec_helper'
require 'combinatorics/choose/extensions/set'
require 'choose/mixin_examples'

describe Set do
  subject { Set }

  it_should_behave_like 'Choose::Mixin'
end
