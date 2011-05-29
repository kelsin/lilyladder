require 'spec_helper'

describe Match do
  context "with 2 reverse matches" do
    before do
      @match1 = Match.make_unsaved
      @match2 = Match.make_unsaved(:round => @match1.round)

      @player1 = Player.make_unsaved(:match => @match1, :registration => @match1.winner)
      @player2 = Player.make_unsaved(:match => @match1, :registration => @match2.winner)
      @player3 = Player.make_unsaved(:match => @match2, :registration => @match1.winner)
      @player4 = Player.make_unsaved(:match => @match2, :registration => @match2.winner)
    end

    subject { @match1 }

    its(:to_s) { should eq("#{@player1.name} vs @{@player2.name}") }

    it "should sort correctly" do
      @match1.<=>(@match2).should == @match1.round.<=>(@match2.round)
    end
  end
end
