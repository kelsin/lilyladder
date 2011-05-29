require 'spec_helper'

describe Round do
  context "with a position of 2" do
    before { @round = Round.make_unsaved(:position => 2) }
    subject { @round }

    its(:to_s) { should eq("Round #{@round.position}") }
  end

  context "with 2 rounds" do
    before do
      @round1 = Round.make_unsaved
      @round2 = Round.make_unsaved
    end

    it "should order correctly" do
      @round1.<=>(@round2).should == @round1.starts_at.<=>(@round2.starts_at)
    end
  end
end
