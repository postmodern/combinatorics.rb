require 'spec_helper'
require 'combinatorics/enumerator'

describe Combinatorics::Enumerator do
  it "should auto-detect the Enumerator class" do
    Combinatorics::Enumerator.should_not be_nil
  end
end
