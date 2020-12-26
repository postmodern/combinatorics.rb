require 'spec_helper'
require 'combinatorics/enumerator'

describe Combinatorics::Enumerator do
  it "should auto-detect the Enumerator class" do
    expect(Combinatorics::Enumerator).not_to be_nil
  end
end
