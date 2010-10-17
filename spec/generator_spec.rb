require 'spec_helper'
require 'combinatorics/generator'

describe Combinatorics::Generator do
  it "should auto-detect the Generator class" do
    Combinatorics::Generator.should_not be_nil
  end
end
