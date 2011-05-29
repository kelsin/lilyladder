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
  end
end
