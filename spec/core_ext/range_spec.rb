require 'spec_helper'
require 'combinatorics/core_ext/range'

describe Range do
  describe "&" do
    it "should pick the maximum beginning value" do
      expect(((100..200) & (150..200)).first).to eq(150)
    end

    it "should pick the minimum ending value" do
      expect(((100..150) & (100..200)).last).to eq(150)
    end
  end

  describe "upto" do
    subject { 1..10 }

    it "should iterate over every beginning value" do
      expect(subject.upto(5..10).to_a).to eq([
        (1..10),
        (2..10),
        (3..10),
        (4..10),
        (5..10)
      ])
    end

    it "should iterate over every ending value" do
      expect(subject.upto(1..15).to_a).to eq([
        (1..10),
        (1..11),
        (1..12),
        (1..13),
        (1..14),
        (1..15)
      ])
    end

    it "should not iterate up to lower bounding ranges" do
      expect(subject.upto(0..5).to_a).to be_empty
    end
  end

  describe "downto" do
    subject { 5..15 }

    it "should iterate over every beginning value" do
      expect(subject.downto(1..15).to_a).to eq([
        (5..15),
        (4..15),
        (3..15),
        (2..15),
        (1..15)
      ])
    end

    it "should iterate over every ending value" do
      expect(subject.downto(5..10).to_a).to eq([
        (5..15),
        (5..14),
        (5..13),
        (5..12),
        (5..11),
        (5..10)
      ])
    end

    it "should not iterate down to upward bounding ranges" do
      expect(subject.downto(10..20).to_a).to be_empty
    end
  end
end
