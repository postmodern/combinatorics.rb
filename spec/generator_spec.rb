require 'spec_helper'
require 'combinatorics/generator'

describe Combinatorics::Generator do
  it "should auto-detect the Generator class" do
    expect(Combinatorics::Generator).not_to be_nil
  end
end
