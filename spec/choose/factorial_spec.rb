require 'spec_helper'
require 'combinatorics/choose/factorial'

describe "Choose#factorial" do
  subject { Object.new.extend(Combinatorics::Choose) }

  it "should default to the factorial of 1" do
    subject.factorial.should == 1
  end

  it "should calculate the factorial of 0" do
    subject.factorial(0).should == 0
  end

  it "should calculate the factorial of numbers greater than 1" do
    subject.factorial(3).should == 6
  end
end
