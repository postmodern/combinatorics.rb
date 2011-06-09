require 'spec_helper'
require 'derange/mixin_examples'

require 'combinatorics/derange/extensions/array'

describe Array do
  subject { Array }

  it_should_behave_like "Derange::Mixin"
end
